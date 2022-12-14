class RolesController < ApplicationController
    require 'rubygems'
    require 'twilio-ruby'
    require 'securerandom'
    require 'time'
    require 'json'
    @user = Current.user

    def bank_verification
        
    end


    def sms_verification
        @user = Current.user
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        @client = Twilio::REST::Client.new(account_sid, auth_token)
        random_number = number
        valid_until = valid_time
        message = @client.messages.create(from: '+13149882610',body: random_number,to: '+421949867743')
    
        begin
            # put the rest of the code inside the try block
            my_hash = {
                "sms_code" => random_number,
                "valid_until" => valid_until
            }
            json = my_hash.to_json
            @user.sms_code = json
            @user.assign_attributes(password_params)
            if @user.save
                render json: { message: "your code has been send now post it to /verify to get verified" }
            else
                render json: { message: "there was an error generatinng your code", errors: @user.errors }, status: :unprocessable_entity
            end
            rescue => e
            # if an exception is raised, render a JSON response with the error message
            render json: { message: "there was an error: #{e.message}" }, status: :internal_server_error
            end
        end

    def verify
        @user = Current.user
        input_code = params[:sms_code].to_i
        current_user = Current.user
        sms_code = JSON.parse(current_user.sms_code)
        code = sms_code["sms_code"]
        valid = sms_code["valid_until"]
        now = Time.now
        if input_code == code
            render json:{message: "you have been sucessfully veriefied"}
            @user.veriefied == true
        else
            render json: {error:"an error occured",input:input_code,code:code}
        end
    end
    def num
        current_user = Current.user
        sms_code = JSON.parse(current_user.sms_code)
        
        render json: {data:sms_code["valid_until"]}
    end
    def change_role
        @user = Current.user
        if @user.role == 'newclient'
          @user.role = 'client'
          @user.assign_attributes(password_params)
          if @user.save
            render json: {message: "your role has been changed to client"}
          else
            render json: {message: "there was an error changing your role", errors: @user.errors}, status: :unprocessable_entity
          end
        else
          render json: {message: "your role is not suitable for change"}
        end
    end
    private
      
      def password_params
        params.permit(:password, :password_confirmation)
      end
      def number
        random_number = SecureRandom.random_number(999999)
      end
      def valid_time
        current_time = Time.now
        valid_time = current_time + (10 * 60)
        return valid_time
      end 
end



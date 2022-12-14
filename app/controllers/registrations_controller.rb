class RegistrationsController < ApplicationController
    # new user sign_up
    def sign_up
        @user = User.new
    end
    

    # accepts paramaters. and if the are valid, creates session - loggs in user
    def create
        @user = User.new(user_params)
        @user.asign_default_role
        if @user.save
          session[:user_id] = @user.id
          render json:{message: "user saved successfully"}

        else
          render json:{message:"Wrong register credentials"}, :status => 403
        end
    end
    def status
      var = {json:"json"}
      tasks = "task!"
      render :json => var, status: :ok
    end
    
      private

    #paramaters that are needed
    def user_params
        params.permit(:email, :password,:password_confirmation)
    end


end

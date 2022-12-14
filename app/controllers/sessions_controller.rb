class SessionsController < ApplicationController

    # creates new session if user validates
    def create
      user = User.find_by(email: params[:email])
  
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {message:"Logged in successfully"}
      else
        render json: {message:'Wrong email or password'}
      end
    # deletes session, loggs out user
    end
    def destroy
      session[:user_id] = nil
      render json:{notice:'Logged out'}
    end
  
    
end
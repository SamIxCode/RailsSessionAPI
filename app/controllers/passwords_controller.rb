class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit
  end
  #updates password only if user is logged in
  def update
   if  Current.user.update(password_params)
    render json: {alert: "password was updated"}
   else
    render json: {alert: 'error'}
    end
  end

  private
  
  #parameters that are only allowed to be accepted
  def password_params
    params.permit(:password,:password_confirmation) 
  end
end

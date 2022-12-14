class UsersController < ApplicationController
    before_action :authenticate_user!

    def role
        if Current.user.role.nil?
            render json: {alert:"you have not been assigned a role yet"}
       else
            role = Current.user.role
            render json: {role: role}
       end
    end
    def current_email
       email =  Current.user.email

        render json: {email:email}, :status => 200
    end

end    
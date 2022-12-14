class ApplicationController < ActionController::API
    #protect_from_forgery with: :null_session
    before_action :set_current_user
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def authenticate_user!
        if Current.user.nil? 
            render json:{alert: "You have to be signed in to access this page"}, :status => 400
        end
    end

    # def check_role!
    #     render json:{alert: "You role does not allow acess to this page"} 
    #         #Current.user.has_role? :admin
    #     if
    #         Current.user.has_role? :admin == true
    #     end
    # end
end

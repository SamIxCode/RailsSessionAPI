class PagesController < ApplicationController
    before_action :authenticate_user!
    def home
        user = Current.user
        render json: {
            message:"success",
            user:user
            }
    end

    def current_user
        user = Current.user
        render json:{user:user}
    end

    def recordquerry
        name = request.headers[:name]
        record = Record.find_by(record_name: name).record_info
        
        render json:{
            name:name,
            created_at:record
            }
    end
end

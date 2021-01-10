class ApplicationController < ActionController::Base
    def current_uer_like
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end

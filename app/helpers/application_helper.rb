module ApplicationHelper
    def logged_in?
        !!session[:username]
    end

    def current_user
        @current_user ||= User.find_by_username(session[:username]) if !! session[:username]

    end
end
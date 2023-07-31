class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :render_errors
    before_action :logged_in

    private
    def render_errors(object)
        return unless object.errors.any?

        flash[:error] = object.errors.full_messages.join(", ")
    end
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in
      !!current_user
    end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
  end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def require_user
      unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to root
        return false
      end
    end

    def ajax_require_user
      unless current_user
        ajax_error_response("please login in order to continue", true)
        return false
      end
    end
end

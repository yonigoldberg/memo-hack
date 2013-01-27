class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @authentication = Authentication.find_from_auth(auth)
    if @authentication
      UserSession.create(@authentication.user, true)
      @authentication.update_authentication(auth)
      redirect_to :root
    else
      # User is new to this application
      @new_auth = Authentication.create_from_auth(auth, current_user)
      UserSession.create(@new_auth.user, true)
      redirect_to :root
    end
  end

 def destroy
    current_user_session.destroy unless current_user_session.nil?
    flash[:notice] = "Logout successful!"
    redirect_to :root
  end
end

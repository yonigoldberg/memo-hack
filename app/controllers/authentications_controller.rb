class AuthenticationsController < ApplicationController

  def create
    puts "HELLO #{request.env['omniauth.auth']}"
    redirect_to :root
  end

end
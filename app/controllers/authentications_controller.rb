class AuthenticationsController < ApplicationController

  def create
    puts "HELLO #{request.env['omniauth.auth']}"
  end

end
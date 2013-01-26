class HomeController < ApplicationController

	def index
		redirect_to :memory if (current_user)
	end

end

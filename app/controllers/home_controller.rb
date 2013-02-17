class HomeController < ApplicationController
	def index
		if (current_user)
			redirect_to :memory
		end
	end
end

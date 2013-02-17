module ApplicationHelper
	def signed_in?
		current_user.nil?
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
		redirect_to root_path unless signed_in?
	end

end

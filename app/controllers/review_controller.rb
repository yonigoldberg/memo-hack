class ReviewController < ApplicationController
  before_filter :require_user

	def review
		@posts = TumblrHelper.get_posts(current_user)
	end
end

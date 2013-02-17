class ReviewController < ApplicationController
  before_filter :require_user

	def review
		all_posts = TumblrHelper.get_posts(current_user)
		@posts_hash = UserQuestion.get_posts_by_user_hash(current_user)
		@posts = all_posts.select {|v| v["state"] == "published"}
		@drafts = all_posts.select {|v| v["state"] == "private"}
	end

	def current
		redirect_to "#{review_path}/#{current_user.id}"
	end
end

class ReviewController < ApplicationController
  # before_filter :require_user

	def review
		user = User.find(params[:id])
		all_posts = TumblrHelper.get_posts(user)
		@posts_hash = UserQuestion.get_posts_by_user_hash(user)
		@posts = all_posts.select {|v| v["state"] == "published"}
		@drafts = current_user_id?(Integer(params[:id])) ? all_posts.select {|v| v["state"] == "private"} : nil
	end

	def current
		redirect_to "#{review_path}/#{current_user.id}"
	end
end

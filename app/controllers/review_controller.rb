class ReviewController < ApplicationController
  before_filter :require_user

	def review
		all_posts = TumblrHelper.get_posts(current_user)
		puts UserQuestion.get_posts_by_user_hash(current_user["id"]).inspect
		@posts = all_posts.select {|v| v["state"] == "published"}
		@drafts = all_posts.select {|v| v["state"] == "private"}
	end
end

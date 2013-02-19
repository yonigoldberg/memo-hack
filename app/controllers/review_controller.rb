class ReviewController < ApplicationController
  # before_filter :require_user
  include TimelineHelper

	def review
		user = User.find(params[:id])
		all_posts = TumblrHelper.get_posts(user)		
		@posts_hash = UserQuestion.get_user_questions_hash(params[:id])
		@posts = all_posts.select {|v| v["state"] == "published"}
		@drafts = current_user_id?(Integer(params[:id])) ? all_posts.select {|v| v["state"] == "private"} : nil
	end

	def current
		redirect_to "#{review_path}/#{current_user.id}"
	end

	def timeline
		respond_to do |format|
			format.html
			format.json	{ render :json => timeline_json(User.find(params[:id]))}
		end
	end

	def timeline_json(user)
		user_info = TumblrHelper.tumblr_api_get_user_info(current_user)
		date = TimelineHelper.posts_to_timeline_data( UserQuestion.get_user_posts_hash(user) )
		{:timeline => {
			:headline => "The life of #{user_info['response']['user']['name']}",
			:type => "default",
			:text => "<p>Intro to my life </p>",
			:asset => {
	            :media => "http://yourdomain_or_socialmedialink_goes_here.jpg",
	            :credit => "Credit Name Goes Here",
	            :caption => "Caption text goes here"
	        },
			:date => date,
			:era => [
				{
					"startDate" =>"2011,12,10",
	                "endDate" => "2011,12,11",
	                "headline" => "Headline Goes Here",
	                "text" => "<p>Body text goes here, some HTML is OK</p>",
	                "tag" => "This is Optional"
				}
			]
		}}

		
	end
end

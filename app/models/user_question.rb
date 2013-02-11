class UserQuestion < ActiveRecord::Base
	belongs_to :user
	belongs_to :question 
  attr_accessible :location, :occured, :tumblr_id, :question_id, :user_id, :is_draft


	def self.create_from_question_params_and_user_id(current_user, params, create_new = true)
		if (user_question = UserQuestion.where("user_id = ? AND question_id = ?", current_user[:id], params[:qid]).first)
			return user_question 
		end

		return nil if (!create_new)

		user_question = UserQuestion.create(:user_id => current_user[:id],
		:question_id => params[:qid],
		:is_draft => true )
	end

	def update_from_parameters(params, current_user)
		self.location = params[:location] if params.has_key?("location")
		self.occured = params[:occured] if params.has_key?("occured")
		self.tumblr_id = params[:tumblr_id] if params.has_key?("tumblr_id")

		if (params.has_key?("title") || params.has_key?("body"))
			if (self.tumblr_id.nil?)
				response = TumblrHelper.create_post_as_draft(current_user,params[:title], params[:body])
				self.tumblr_id = response["response"]["id"]
			else
				response = TumblrHelper.update_post(current_user,self.tumblr_id, params)
			end
		end
		self.save
		return response
	end

	def get_tumblr_post(current_user)
		post = TumblrHelper.get_posts(current_user, {"id" => self.tumblr_id} ) unless self.tumblr_id.nil?
	end

	def self.get_posts_by_user_hash(user_id)
		posts = UserQuestion.where("user_id = ?", user_id)
		posts_hash = Hash.new{|h,k| h[k] = []}
		posts.each do |p|
			posts_hash[p.tumblr_id] << p
		end

		return posts_hash
	end


end
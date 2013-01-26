class Question < ActiveRecord::Base
  	attr_accessible :title, :question, :follower_id, :user_id
  	belongs_to :user
end

class User < ActiveRecord::Base
  	attr_accessible :email, :name
  	has_many :UserQuestions
	validates :name, :email, :presence => true
end
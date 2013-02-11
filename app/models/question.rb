class Question < ActiveRecord::Base
	has_many :user_questions
  attr_accessible :question, :title
end

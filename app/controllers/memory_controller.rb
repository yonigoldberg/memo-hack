class MemoryController < ApplicationController
	
	def memory
		@question = Question.first(:offset => rand(Question.count))
	end
	
	def add_question
		@q = Question.new(:title => params[:title], :question => params[:question]);
		@q.save
		redirect_to :question_form
	end

	def question_form
	end
end

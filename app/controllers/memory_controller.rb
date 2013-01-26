class MemoryController < ApplicationController
	
	def memory
		puts params
		if (params.has_key?('qid'))
			@question = Question.find(params[:qid])	
		else
			redirect_to :action => "memory", :qid => Question.first(:offset => rand(Question.count))
		end
	end
	
	def add_question
		@q = Question.new(:title => params[:title], :question => params[:question]);
		@q.save
		redirect_to :question_form
	end

	def question_form
	end
end

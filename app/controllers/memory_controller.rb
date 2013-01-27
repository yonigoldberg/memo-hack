class MemoryController < ApplicationController
	include TumblrHelper

	before_filter :require_user

	def memory
		@blogs = TumblrHelper.get_blog_list(current_user)

		if (params.has_key?('qid'))
			random_memory() unless @question = Question.find_by_id(params[:qid])
		else
			random_memory()
		end
	end

	def add_question
		@q = Question.new(:title => params[:title], :question => params[:question]);
		@q.save
		redirect_to :question_form
	end

	def question_form
	end

	def random_memory
		redirect_to :action => "memory", :qid => Question.first(:offset => rand(Question.count))
	end
end

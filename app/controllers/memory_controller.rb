class MemoryController < ApplicationController
	include TumblrHelper

	before_filter :require_user

	def memory
		if no_questions
			return
		elsif (params.has_key?('qid'))
			random_memory() unless @question = Question.find_by_id(params[:qid])
		else
			random_memory()
		end
	end

	def save_memory_draft
		if (TumblrHelper.save_post_as_draft(current_user,params[:title], params[:body], params[:date], params[:location]))
			render :text => "created", :status => 201
		else
			render :text => "Error while creating post on tumbler", :status => 400
		end

	end

	def add_question
		@q = Question.new(:title => params[:title], :question => params[:question]);
		@q.save
		redirect_to :question_form
	end

	def question_form
	end


	def no_questions
		Question.count == 0
	end

	def random_memory
		redirect_to :action => "memory", :qid => Question.first(:offset => rand(Question.count))
	end
end

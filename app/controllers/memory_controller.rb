class MemoryController < ApplicationController
	include TumblrHelper

	before_filter :require_user

	def memory
		if no_questions
			return
		elsif (params.has_key?('qid'))
			@qid = params[:qid]
			random_memory() unless @question = Question.find_by_id(@qid)
		
			@user_question = UserQuestion.create_from_question_params_and_user_id(current_user,params,false)
			@post = @user_question.get_tumblr_post(current_user) unless @user_question.nil?
		else
			random_memory()
		end
	end

	def save_memory_draft
		@user_question = UserQuestion.create_from_question_params_and_user_id(current_user,params)
		response = @user_question.update_from_parameters(params,current_user)

		case (response['meta']['status'])
		when 200
			render :text => "updated", :status => 200
		when 201
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

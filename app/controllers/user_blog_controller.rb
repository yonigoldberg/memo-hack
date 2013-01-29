class UserBlogController < ApplicationController
  before_filter :require_user

  def select_blog
    @blogs = TumblrHelper.get_blog_list(current_user)
  end

  def save
    blog_name = params[:blog_name]
    blog = find_blog(blog_name)
    UserBlog.create(:user_id => current_user.id, :blog_name=>blog['name'], :blog_url=> blog['url']) unless blog.nil?
    redirect_to :root
  end

  private
  def find_blog (blog_name)
    blogs = TumblrHelper.get_blog_list(current_user)
    blogs.select{|b| b['name'] == blog_name}.first
  end


end

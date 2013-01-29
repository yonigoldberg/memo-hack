class UserBlog < ActiveRecord::Base
  belongs_to :user
  attr_accessible :blog_name, :blog_url, :user_id

end
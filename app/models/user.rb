class User < ActiveRecord::Base
  attr_accessible :tumblr_uid, :nickname, :avatar
  has_many :UserQuestions
  has_many :authentications, :dependent => :destroy

  acts_as_authentic do |c|
    c.ignore_blank_passwords = true #ignoring passwords
    c.validate_password_field = false #ignoring validations for password fields
  end

  def self.create_from_tumblr_omniauth(auth)
    return user if user = User.find_by_tumblr_uid(auth['uid'])
    User.create(:tumblr_uid => auth['uid'],
      :nickname => auth["info"]["nickname"],
      :avatar => auth["info"]["avatar"])
  end
end
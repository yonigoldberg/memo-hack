class User < ActiveRecord::Base
  attr_accessible :tumblr_uid, :nickname, :avatar
  has_one :user_blog
  has_many :authentications, :dependent => :destroy
  has_many :user_questions

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


  def prepare_tumblr_access_token
    #TODO add error handling
    auth = get_tumblr_authentication
    consumer = OAuth::Consumer.new(ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET'],
      {:site => "http://www.tumblr.com/"})

    token_hash = {:oauth_token => auth.token,:oauth_token_secret => auth.secret}
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  end

  def blog
    self.user_blog
  end

  private
  def get_tumblr_authentication
   authentications = self.authentications.select {|auth| auth.provider == "tumblr"}
   authentications.first unless authentications.empty?
  end

end
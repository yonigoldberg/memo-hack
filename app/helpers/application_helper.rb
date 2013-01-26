module ApplicationHelper
  def self.prepare_tumblr_access_token(user)
    consumer = OAuth::Consumer.new(ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET'],
      {:site => "http://www.tumblr.com/"})
    token_hash = {:oauth_token => user.token,:oauth_token_secret => user.secret}
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  end
end

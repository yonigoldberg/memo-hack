module TumblrHelper
  def self.get_blog_list(current_user)
    access_token = current_user.prepare_tumblr_access_token
    json = MultiJson.load(access_token.get("http://api.tumblr.com/v2/user/info").body.to_s)
    json['response']['user']['blogs']
  end
end
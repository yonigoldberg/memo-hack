module TumblrHelper
  def self.get_blog_list(current_user)
    access_token = current_user.prepare_tumblr_access_token
    json = MultiJson.load(access_token.get("http://api.tumblr.com/v2/user/info").body.to_s)
    json['response']['user']['blogs']
  end

  def self.save_post_as_draft(current_user, title, body, date, location)
  	access_token = current_user.prepare_tumblr_access_token
    json = MultiJson.load(access_token.post("http://api.tumblr.com/v2/blog/#{current_user.tumblr_uid}.tumblr.com/post", 
    	{
    		:type => "text",	
    		:state => "draft",
    		:title => title,
    		:body => body,
    		:tags => location
    		}).body.to_s)
    json['meta']['status'] == 201 
  end

  # specify type of posts to get - text, quote, link, answer, video, audio, photo, chat (none is any kind)
  def self.get_posts(current_user)
  	access_token = current_user.prepare_tumblr_access_token
  	json = MultiJson.load(access_token.get("http://api.tumblr.com/v2/blog/#{current_user.tumblr_uid}.tumblr.com/posts?api_key=#{ENV['TUMBLR_KEY']}").body.to_s)
  	json['response']['posts']
  end

  def self.get_drafts(current_user)
  	access_token = current_user.prepare_tumblr_access_token
  	json = MultiJson.load(access_token.get("http://api.tumblr.com/v2/blog/#{current_user.tumblr_uid}.tumblr.com/posts/draft?api_key=#{ENV['TUMBLR_KEY']}").body.to_s)
  	json['response']['posts']
  end
end
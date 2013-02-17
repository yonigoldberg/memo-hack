module TumblrHelper
  def self.get_blog_list(current_user)
    access_token = current_user.prepare_tumblr_access_token
    json = MultiJson.load(access_token.get("http://api.tumblr.com/v2/user/info").body.to_s)
    json['response']['user']['blogs']
  end

  def self.create_post_as_draft(current_user, title, body)
  	access_token = current_user.prepare_tumblr_access_token
    json = tumblr_api_post_request_json(current_user,"post", {
    		:type => "text",	
    		:state => "private",
    		:title => title,
    		:body => body,
    		})
  end

  def self.update_post(current_user, post_id, params)
    params[:id] = post_id
    tumblr_api_post_request_json(current_user,"post/edit", params) 
  end

  # specify type of posts to get - text, quote, link, answer, video, audio, photo, chat (none is any kind)
  def self.get_posts(current_user, params = {})
    json = self.tumblr_api_get_request_json(current_user, "posts", params)
  	json['response']['posts']
  end

  def self.delete_post(current_user, post_id)
    
  end

  def self.get_drafts(current_user)
  	json = self.tumblr_api_get_request_json(current_user, "posts/draft")
  	json['response']['posts']
  end

  def self.tumblr_api_get_request_json(current_user, api_url, parameters={})
    access_token = current_user.prepare_tumblr_access_token
    parameters["api_key"] = ENV['TUMBLR_KEY']
    json = MultiJson.load(access_token.get("http://api.tumblr.com/v2/blog/#{current_user.user_blog.blog_name}.tumblr.com/#{api_url}?api_key=#{ENV['TUMBLR_KEY']}&id=#{parameters['id']}").body.to_s)
  end

  def self.tumblr_api_post_request_json(current_user, api_url, parameters={})
    access_token = current_user.prepare_tumblr_access_token
    json = MultiJson.load(access_token.post("http://api.tumblr.com/v2/blog/#{current_user.user_blog.blog_name}.tumblr.com/#{api_url}", parameters).body.to_s)
  end
end
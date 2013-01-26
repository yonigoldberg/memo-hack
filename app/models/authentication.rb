class Authentication < ActiveRecord::Base
    belongs_to :user
    validates :user_id, :uid, :provider, :presence => true
    validates_uniqueness_of :uid, :scope => :provider
    attr_accessible :uid, :provider, :user_id, :token, :secret

    def update_authentication(auth)
      self.token = auth['credentials']['token']
      self.secret = auth["credentials"]["secret"]
      self.save
    end

    def self.find_from_auth(auth)
      find_by_provider_and_uid(auth['provider'], auth['uid'])
    end

    def self.create_from_auth(auth, user = nil)
      puts "PROVIDER: #{auth['provider']}"
      if (auth['provider'] == 'tumblr')
        user ||= User.create_from_tumblr_omniauth(auth)
      end
      Authentication.create(:user_id => user.id,
        :provider => auth['provider'],
        :uid => auth['uid'],
        :token => auth['credentials']['token'],
        :secret => auth["credentials"]["secret"])
    end
end

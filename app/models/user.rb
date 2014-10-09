class User < ActiveRecord::Base
  # Create a user from its omniauth authentification details.
  #
  # auth - The omniauth authentification details.
  #
  # Returns self.
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider     = auth['provider']
      user.uid          = auth['uid']
      user.oauth_token  = auth['credentials']['token']
      user.oauth_secret = auth['credentials']['secret']

      if auth['info']
        user.name       = auth['info']['name'] || ""
      end

    end
  end
end

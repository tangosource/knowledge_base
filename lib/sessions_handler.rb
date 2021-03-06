class SessionsHandler
  class << self
    def find_or_create_user(user_data)
      uid                   = user_data['uid'].to_s
      user_data_info        = user_data['info']
      user_data_credentials = user_data['credentials']

      User.where(uid: uid).first_or_create!(
        name: user_data_info['name'],
        email: user_data_info['email'],
        first_name: user_data_info['first_name'],
        last_name: user_data_info['last_name'],
        image: user_data_info['image'],
        token: user_data_credentials['token'],
        token_refresh_token: user_data_credentials['refresh_token'],
        token_expires_at: user_data_credentials['expires_at']
      )
    end

    def tango_email?(email)
      email.match(/@tangosource.com/)
    end
  end
end

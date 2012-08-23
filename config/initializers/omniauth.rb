Rails.application.config.middleware.use OmniAuth::Builder do
  provider :heroku, ENV["HEROKU_OAUTH_ID"], ENV["HEROKU_OAUTH_SECRET"]
  provider :github, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET']
end

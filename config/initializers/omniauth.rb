Rails.application.config.middleware.use OmniAuth::Builder do
  # replace with YOUR app's 'Consumer key' and 'Consumer secret' from Twitter:
  # (see dev.twitter.com to setup an app and obtain its key and secret)
  twitter_key = ENV["TWITTER_KEY"]
  twitter_secret = ENV["TWITTER_SECRET"]
  provider :twitter, twitter_key, twitter_secret
end
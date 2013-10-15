Rails.application.config.middleware.use OmniAuth::Builder do
  # replace with YOUR app's 'Consumer key' and 'Consumer secret' from Twitter:
  # (see dev.twitter.com to setup an app and obtain its key and secret)
  twitter_key = ENV["TWITTER_KEY"]
  twitter_secret = ENV["TWITTER_SECRET"]
  provider :twitter, twitter_key, twitter_secret

  fb_key = ENV["FB_KEY"]
  fb_secret = ENV["FB_SECRET"]
  provider :facebook, fb_key, fb_secret

  google_key = ENV["GOOGLE_KEY"]
  google_secret = ENV["GOOGLE_SECRET"]
  provider :google, google_key, google_secret

  google_key = ENV["GOOGLE_KEY"]
  google_secret = ENV["GOOGLE_SECRET"]
  provider :google_oauth2, google_key, google_secret
end
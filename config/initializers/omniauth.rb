Rails.application.config.middleware.use OmniAuth::Builder do
  # replace with YOUR app's 'Consumer key' and 'Consumer secret' from Twitter:
  # (see dev.twitter.com to setup an app and obtain its key and secret)
  key = ENV["TWITTER_KEY"] #'gtYLGol7lhrqTpnDLCbnww'
  secret = ENV["TWITTER_SECRET"] #'4IN5Ad6E0T0kSPwxlGlkYa4qx3Xd76iSUU3UMOX8a4'
  provider :twitter, key, secret
end
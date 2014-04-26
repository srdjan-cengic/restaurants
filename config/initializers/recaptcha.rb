# By default, all keys work on "localhost" (or "127.0.0.1"), 
# so you can always develop and test on your local machine.)
Recaptcha.configure do |config|
  config.public_key  = ENV["RECAPTCHA_PUBLIC_KEY"]
  config.private_key = ENV["RECAPTCHA_PRIVATE_KEY"]
end
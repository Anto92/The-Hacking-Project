 # ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

p "consumer_key stp ?"
twitter_consumer_key = gets.chomp
p "consumer_secret stp ?"
twitter_consumer_secret = gets.chomp
p "consumer_token stp ?"
twitter_consumer_token = gets.chomp
p "consumer_token_secret stp ?"
twitter_consumer_token_secret = gets.chomp

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_consumer_key
  config.consumer_secret     = twitter_consumer_secret
  config.access_token        = twitter_consumer_token
  config.access_token_secret = twitter_consumer_token_secret
end

# ligne qui permet de tweeter
client.update("Bonjour monde !")

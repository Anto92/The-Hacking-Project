 # ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

input_array = ARGV

if input_array.length != 4
  puts "Usage: ruby filename.rb [consumer_key] [consumer_secret] [consumer_token] [consumer_token_secret]"
  exit
else
	twitter_consumer_key = ARGV[0].to_s
	twitter_consumer_secret = ARGV[1].to_s
	twitter_consumer_token = ARGV[2].to_s
	twitter_consumer_token_secret = ARGV[3].to_s
end


client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = twitter_consumer_key
  config.consumer_secret     = twitter_consumer_secret
  config.access_token        = twitter_consumer_token
  config.access_token_secret = twitter_consumer_token_secret
end

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end

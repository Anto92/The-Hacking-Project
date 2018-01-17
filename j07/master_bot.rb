require 'twitter'

def send_tweet
  @client.update("Hello @Shownertheot, from my 'SEND_TWEET' method")
end

def send_multiple_tweets
  arr = ["@BlierBea", "@Shownertheot"]
  arr.each do |user|
    @client.update("Hello #{user}, from my 'SEND_MULTIPLE_TWEETS' method")
  end
end

def send_private_message
  # Array de 1 personne car mon seul follower :(
  arr = ["@AzZz_777"]
  arr.each do |user|
    @client.create_direct_message(user, "Coucou #{user}, from my 'SEND_PRIVATE_MESSAGE' method")
  end
end

def streamer
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = @twitter_consumer_key
    config.consumer_secret     = @twitter_consumer_secret
    config.access_token        = @twitter_consumer_token
    config.access_token_secret = @twitter_consumer_token_secret
  end

  topics = ["coffee", "tea"]
  client.filter(track: topics.join(",")) do |object|
    puts object.text if object.is_a?(Twitter::Tweet)
  end
end

def pilot

input_array = ARGV

if input_array.length != 4
  puts "Usage: ruby filename.rb [consumer_key] [consumer_secret] [consumer_token] [consumer_token_secret]"
  exit
else
  @twitter_consumer_key = ARGV[0].to_s
  @twitter_consumer_secret = ARGV[1].to_s
  @twitter_consumer_token = ARGV[2].to_s
  @twitter_consumer_token_secret = ARGV[3].to_s
end
  
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = @twitter_consumer_key
    config.consumer_secret     = @twitter_consumer_secret
    config.access_token        = @twitter_consumer_token
    config.access_token_secret = @twitter_consumer_token_secret
  end

  puts "\n======== Commands ========\n
1 = Send a Tweet
2 = Send multiple Tweets
3 = Send private massage
4 = Streamer\n\n"

print "Choice: "
choice = STDIN.gets.chomp.to_s
case choice
when "1"
  # puts "Ok, gonna send"
  send_tweet
when "2"
  # puts "Ok, gonna send mult tweets"
  send_multiple_tweets
when "3"
  # puts "Ok, gonna send PM"
  send_private_message
when "4"
  # puts "Ok, gonna Stream"
  streamer
end
end

pilot



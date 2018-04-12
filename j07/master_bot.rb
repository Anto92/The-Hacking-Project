require 'twitter'

def send_tweet
  puts "\nWhat do you want to tweet ?"
  print "My tweet: "
  # Récupère un message de l'utilisateur et le Tweet
  message = STDIN.gets.chomp.to_s
  @client.update(message)
end

def send_multiple_tweets
  # rentrez les usernames des personnes que vous voulez mentionner dans votre tweet
  arr = ["@BlierBea", "@Shownertheot"]
  arr.each do |user|
    # Salue chaque personne avec son nom Twitter
    @client.update("Hello #{user}, from my 'SEND_MULTIPLE_TWEETS' method")
  end
end

def send_private_message
  # Array de 1 personne car mon seul follower :(
  # Même méthodo que la méthode send_multiple_tweets, syntaxe un peu différente 
  arr = ["@AzZz_777"]
  arr.each do |user|
    @client.create_direct_message(user, "Coucou #{user}, from my 'SEND_PRIVATE_MESSAGE' method")
  end
end

def streamer
  # Voir https://github.com/sferik/twitter#streaming
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

# C'est la première méthode qui est appelée
def pilot

# Utilisation de ARGV passer les clés et token en ligne de commande plutot que de les mettre en plaintext dans mon code
# Voir https://www.codecademy.com/articles/ruby-command-line-argv si pas clair
input_array = ARGV

# Si l'utilisateur ne donne pas ses 4 tokens et clés en executant le programme, lui indiquer comment marche le programme et quitter
if input_array.length != 4
  puts "Usage: ruby filename.rb [consumer_key] [consumer_secret] [consumer_token] [consumer_token_secret]"
  exit
else
  # Si l'utilisateur donne ses tokens/clés correctement, les ranger dans des variables d'instances (accessibles ailleurs dans le programme)
  @twitter_consumer_key = ARGV[0].to_s
  @twitter_consumer_secret = ARGV[1].to_s
  @twitter_consumer_token = ARGV[2].to_s
  @twitter_consumer_token_secret = ARGV[3].to_s
end
  
  # quelques lignes qui enregistrent les clés d'APIs
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

# L'utilisateur choisit l'action qu'il veut que le bot réalise
print "Choice: "
choice = STDIN.gets.chomp.to_s

# Si l'utilisateur chosit 1, la fonction send_tweet sera appelée, 2 ==> send_multiple_tweets, ...
case choice
when "1"
  send_tweet
when "2"
  send_multiple_tweets
when "3"
  send_private_message
when "4"
  streamer
end
end

pilot

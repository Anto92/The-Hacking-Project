class TwitterBot
	attr_accessor :stream_words
	Dotenv.load

	def initialize(stream_words)
		@stream_words = stream_words
		@twitter_consumer_key = ENV['TWITTER_CONSUMER_KEY']
		@twitter_consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
		@twitter_consumer_token = ENV['TWITTER_CONSUMER_TOKEN']
		@twitter_consumer_token_secret = ENV['TWITTER_CONSUMER_TOKEN_SECRET']
		@count = 5
	end

	def perform
		stream
	end

	def createClientStream
		clientStream = Twitter::Streaming::Client.new do |config|
			config.consumer_key 			= @twitter_consumer_key
			config.consumer_secret 		= @twitter_consumer_secret
			config.access_token 			= @twitter_consumer_token
			config.access_token_secret 	= @twitter_consumer_token_secret
		end
	end

	def createClientREST
		clientREST = Twitter::REST::Client.new do |config|
		  config.consumer_key 			= @twitter_consumer_key
		  config.consumer_secret 		= @twitter_consumer_secret
		  config.access_token 			= @twitter_consumer_token
		  config.access_token_secret 	= @twitter_consumer_token_secret
		end
	end


	def countReset
		@count = 0
	end

	def stream
		clientStream = createClientStream
		clientREST = createClientREST
		topics = @stream_words.split
		clientStream.filter(track: topics.join(",")) do |object|
				if object.is_a?(Twitter::Tweet)
					@count += 1
					clientREST.retweet(object)
					p "Listening Tweets"
					if count == 5
						p "Tweet reply sent"
						clientREST.update("@" + object.user.screen_name + " connaissez-vous The Hacking Project? https://thp-formation.herokuapp.com/", in_reply_to_status_id: object.id)
						countReset()
					end
				end
				sleep(10)
		end
	end
end



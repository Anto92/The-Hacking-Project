require 'dotenv'

class SearchMovie

	def initialize(title)
		Dotenv.load
		Tmdb::Api.key(ENV['API_KEY'])
		@movie = title
	end

	def perform
		search_movie
	end

	def search_movie
		Tmdb::Search.movie("#{@movie}").results
	end
end
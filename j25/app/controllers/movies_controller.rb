class MoviesController < ApplicationController

	def index
	end

	def search
	  title = params.permit(:content)
	  @movies = SearchMovie.new(title[:content]).perform
	end
end

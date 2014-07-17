class MoviePoster
	def initialize(imdb_api)
		@imdb_api = imdb_api
	end

	def for 
		@arrayMovies = []
		if @imdb_api.poster != nil
			@arrayMovies << @imdb_api.poster
		end

	end

end
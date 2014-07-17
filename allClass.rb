require 'pry'
class CallImbd

	def initialize(nameFilm)
		@nameFilm = nameFilm
	end
	
	def poster
		# i = Imdb::Search.new(@nameFilm)
		# posters = []
		# movies = i.movies.take(50)
		# movies.each do |movie|
		# 	posters << movie.poster
		# end
		# posters
		posters = ["http://lorempixel.com/500/500/", "http://lorempixel.com/500/500/", "http://lorempixel.com/500/500/","http://lorempixel.com/500/500/","http://lorempixel.com/500/500/","http://lorempixel.com/500/500/","http://lorempixel.com/500/500/","http://lorempixel.com/500/500/","http://lorempixel.com/500/500/" ]
	end
end

class MoviePoster

	def initialize(imdb_api)
		@imdb_api = imdb_api
		@arrayPostersClean = []
		@numberOfPoster = 9
	end

	def for 
		clean_null_posters(@imdb_api.poster)
	end

	def clean_null_posters(arrayPoster)
		arrayPoster.each do |poster|
			if poster != nil
				@arrayPostersClean << poster
				if @arrayPostersClean.length == @numberOfPoster
					return @arrayPostersClean
				end
			end
		end
		@arrayPostersClean
	end

end
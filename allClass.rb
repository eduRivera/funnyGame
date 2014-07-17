require 'pry'

class CallImbd
	
end
class MoviePoster

	def initialize(imdb_api)
		@imdb_api = imdb_api
		@arrayPostersClean = []
		@numberOfPoster = 3
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
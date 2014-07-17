require 'pstore'
require 'sinatra'
require 'pry'
require 'json'
require 'imdb'
require_relative './allClass'



store = PStore.new("data.pstore")

######################INDEX.erb################################

get '/' do 
	erb :index
end

post '/' do 
	@arrayPoster=[]
	@nameFilm = params[:nameFilm]
	i = Imdb::Search.new(@nameFilm)
	
	 arrayFilms = i.movies.take(9)
	 arrayFilms.each do |item|
	 	if item.poster
	 		@arrayPoster << item.poster
	 	end
	 end

	
	erb :index
end

#####################FUNCTIONS################################

def insert(value, store)
	store.transaction do 
		store[:item_list] ||= []
		store[:item_list] << value
	end
end 

def select(store)
	store.transaction do 
		@tasks = store[:item_list]
	end
	@tasks
end



require 'pstore'
require 'sinatra'
require 'pry'
require 'json'
require 'imdb'

i = Imdb::Search.new("Star Trek")

i.movies.size

######################INDEX.erb################################

get '/' do 
	@movieSize = i.movies.size
	#select(store)#-->method donde se seleccionan las variables que hay guardada en la  list del store, se utiliza una transaccion para que no se ejecuten cosas a medias
	erb :index
end

post '/' do 
	#insert(params[:text1], store)#-->method donde se insertan las variables a la list del store, se utiliza una transaccion para que no se ejecuten cosas a medias
	redirect to('/')
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



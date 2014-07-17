require 'pstore'
require 'sinatra'
require 'pry'
require 'json'

store = PStore.new("data.pstore") #//hacemos un objeto de un documento donde se guardaran las variables
								  #// para que no se borren cada vez que se recargue esta pagina

######################INDEX.erb################################

get '/' do 
	select(store)#-->method donde se seleccionan las variables que hay guardada en la  list del store, se utiliza una transaccion para que no se ejecuten cosas a medias
	erb :index
end

post '/' do 
	insert(params[:text1], store)#-->method donde se insertan las variables a la list del store, se utiliza una transaccion para que no se ejecuten cosas a medias
	redirect to('/')
end
		#*****************DELETE**************************#
post '/delete' do 
	params.each do |item|
		store.transaction do 
			store[:item_list].delete(item[0])	
		end
	end
	redirect to('/')
end

#######################BETA.erb#################################

get '/beta' do
	erb :beta
end

#######################AJAX##################################

get '/api/tasks' do #//cuando ponemos /api/ es para url que solo se utilizaran para ajax
	select(store)#-->method same*
	@tasks.to_json
end

post '/api/tasksRecibo' do
	params.each do |item|#//loop para que por cada parametro haga un insert, en este caso solo pasamos un parametro
		insert(params[:text1], store)#-->method same*
	end
	params[:text1].to_json
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



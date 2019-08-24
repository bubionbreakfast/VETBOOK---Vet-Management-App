require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
# require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/vets' do #index
  @vets = Vet.all
  # @actions = Action.all
  erb ( :"vets/index" )
end

get '/vets/new' do #new
  @vets = Vet.all
  # @zombies = Zombie.all
  erb(:"vets/new")
end

post '/vets' do #show
  vet = Vet.new(params)
  vet.save
  redirect to("/vets")
end

get '/vets/:id' do # create
  @vets = Vet.find( params[:id] )
  erb( :"vets/show" )
end

post '/vets/:id/edit' do #edit
  Vet.delete(params[:id])
  erb (:"vets/edit")
end

post '/vets/:id' do
  Vet.new(params).update
  redirect to ("/vets")
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
# require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/pets' do
  @pets = Pet.all
  # @actions = Action.all
  erb ( :"pets/index" )
end

get '/pets/new' do
  @pets = Pet.all
  # @zombies = Zombie.all
  erb(:"pets/new")
end

post '/pets' do
  pet = Pet.new(params)
  pet.save
  redirect to("/pets")
end

post '/pets/:id/delete' do
  Pet.delete(params[:id])
  redirect to("/pets")
end

get '/pets/:id' do # show
  @pets = Pet.find( params[:id] )
  erb( :"pets/show" )
end

post '/pets/:id/delete' do
  Pet.delete(params[:id])
  redirect to("/pets")
end

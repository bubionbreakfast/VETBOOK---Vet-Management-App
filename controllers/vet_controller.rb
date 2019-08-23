require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
# require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/vets' do
  @vets = Vet.all
  # @actions = Action.all
  erb ( :"vets/index" )
end

get '/vets/new' do
  @vets = Vet.all
  # @zombies = Zombie.all
  erb(:"vets/new")
end

post '/vets' do
  vet = Vet.new(params)
  vet.save
  redirect to("/vets")
end

post '/vets/:id/delete' do
  Vet.delete(params[:id])
  redirect to("/vets")
end

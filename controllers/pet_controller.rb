require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
# require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/pets' do #index
  @pets = Pet.all
  erb ( :"pets/index" )
end

get '/pets/new' do #new
  @pets = Pet.all
  @vets = Vet.all
  erb(:"pets/new")
end

post '/pets' do #show
  pet = Pet.new(params)
  pet.save
  redirect to("/pets")
end

get '/pets/:id' do # create
  @pets = Pet.find( params[:id] )
  erb( :"pets/show" )
end

get '/pets/:id/edit' do # edit
  @vets = Vet.all()
  @pets = Pet.find( params[:id] )
  erb( :"pets/edit" )
end

post '/pets/:id' do #update
  Pet.new(params).update
  redirect to ("/pets")
end

post '/pets/:id/delete' do # delete
  pet = Pet.find( params[:id] )
  pet.delete()
  redirect to '/pets'
end

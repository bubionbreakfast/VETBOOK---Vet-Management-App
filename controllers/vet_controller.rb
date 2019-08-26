require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
# require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/vets' do #index
  @vets = Vet.all
  @pets = Pet.all
  erb ( :"vets/index" )
end

get '/vets/new' do #new
  @vets = Vet.all
  @pets = Pet.new
  erb(:"vets/new")
end

post '/vets' do #index
  vet = Vet.new(params)
  vet.save
  redirect to("/vets")
end

get '/vets/:id' do # show
  @vet = Vet.find( params[:id] )
  @pets = Pet.find( params[:id])
  erb( :"vets/show" )
end

get '/vets/:id/edit' do # edit
  @vets = Vet.find( params[:id] )
  erb( :"vets/edit" )
end

post '/vets/:id' do #update
  Vet.new(params).update
  redirect to ("/vets")
end

post '/vets/:id/delete' do # delete
  vet = Vet.find( params[:id] )
  vet.delete()
  redirect to '/vets'
end

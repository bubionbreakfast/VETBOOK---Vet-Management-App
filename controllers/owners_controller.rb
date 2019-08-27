
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
# require_relative( '../models/action.rb' )
also_reload( '../models/*' )

get '/owners' do #index
  @owners = Owner.all
  erb ( :"owners/index" )
end

get '/owners/new' do #new
  @owners = Owner.all
  erb(:"owners/new")
end

post '/owners' do #show
  owner = Owner.new(params)
  owner.save
  redirect to("/owner")
end

get '/owners/:id' do # create
  @owner = Owner.find( params[:id] )
  erb( :"owners/show" )
end

get '/owners/:id/edit' do # edit
  @owner = Pet.find( params[:id] )
  erb( :"owners/edit" )
end

post '/owners/:id' do #update
  Owner.new(params).update
  redirect to ("/owners")
end

post '/owners/:id/delete' do # delete
  owner = Owner.find( params[:id] )
  owner.delete()
  redirect to '/owners'
end

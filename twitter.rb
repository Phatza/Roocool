require 'sinatra'
require 'shotgun'
require 'sinatra/activerecord'
require './environments'

class Dones < ActiveRecord::Base
end


# Obtenir toutes les infos de la db.
get '/' do 
	@datas = Dones.order("created_at DESC")
	erb :index
end

# Ajouter une info a la db.
post '/dones' do 
	Dones.create(params)
	redirect '/'
end

# modifier une info dans la db en la recuperant via l'ID.
put '/:id' do
	donnees = Dones.find(params[:id])
	donnees.message = params[:message]
	donnees.save
	redirect '/'
end

delete '/:id' do
    Dones.find(params[:id]).destroy
    redirect '/'
end


get '/finder' do
	donnees = Dones.find(params[:message])
	erb :finder
end




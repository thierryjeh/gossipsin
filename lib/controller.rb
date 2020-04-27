require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  
  get '/gossips/new/' do
    erb :new_gossip
  end

 
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'  
  end

  # affiche le potin
  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # le modifie 
  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # met à jour
  post '/gossips/edit/' do
    Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

end
require 'sinatra'
require './lib/menu'
require './lib/item'

get '/' do
  erb :index
end

get '/items' do
  @searched = params[:filter]
  erb :items
end

get '/items/new' do
  erb :item_form
end

post '/items' do
  @name = params[:name]
  erb :items
end

get '/items/:id' do
  @id = params[:id]
  erb :item_by_id
end

get '/items/:id/edit' do
  @id = params[:id]
  erb :item_form
end

post '/items/:id' do
  @id = params[:id]
  @name = params[:name]
  erb :item_by_id
end
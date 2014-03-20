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


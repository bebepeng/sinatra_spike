require 'sinatra'
require './lib/menu'
require './lib/item'

get '/' do
  erb :index
end

get '/items' do
  erb :items
end
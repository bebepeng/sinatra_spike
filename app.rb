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
  has_id = false
  menu_list = CSV.read("./config/menu.csv")
  menu_list.each do |row|
    if row.include?("#{@id}")
      has_id = true
    end
  end

  if has_id
    erb :item_by_id
  else
    erb :not_found
  end

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

delete '/items/:id' do
  @id = params[:id]
  menu = Menu.new('./config/menu.csv')
  menu.delete_item(@id)
  redirect '/items'
end
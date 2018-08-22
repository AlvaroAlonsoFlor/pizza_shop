require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# INDEX

get '/pizza-orders' do
  @orders = PizzaOrder.all
  erb(:index)
end

# NEW

get '/pizza-orders/new' do
  erb(:new)
end

# SHOW

get '/pizza-orders/:id' do
  # id = params[:id].to_i
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# CREATE
post '/pizza-orders' do
  new_order = PizzaOrder.new(params)
  new_order.save
  redirect to '/pizza-orders'
end

# EDIT

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE
put '/pizza-orders/:id' do
  # @order = PizzaOrder.find(params[:id])
  # update_order
  PizzaOrder.new(params).update
  redirect to '/pizza-orders'
end

# DELETE

post '/pizza-orders/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete
  redirect to '/pizza-orders'
end

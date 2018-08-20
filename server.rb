require 'sinatra'
require 'sinatra/activerecord'
require 'faker'
require 'securerandom'
enable :sessions

set :database, 'sqlite3:rumblr.sqlite3'

get '/' do
  @users = User.all
  @posts = Post.all
  erb :home
end

# post '/' do
#
#   class AddPartNumberToProducts < ActiveRecord::Migration[5.2]
#     def change
#       add_column :products, :part_number, :string
#     end
#   end
#
#   if ActiveRecord::Base.connection.column_exists?(:tags, params['tag'].to_sym)
#     params['tag'].to_sym += 1
#   else
#   tag = ActiveRecord::Migration.add_column :tags, params['tag'].to_sym, :string
# params['tag'].to_sym = 1
# end
# tag.save
# end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  user = User.new(
    email: params['email'],
    username: params['username'],
    password: params['password']
  )
  user.save
  redirect '/'
end

post '/login' do
  username = params['username']
  given_password = params['password']
  user = User.find_by(username: username)
  if user.password == given_password
    session[:user] = user
    redirect :account
  else
    p 'Invalid credentials'
    redirect '/'
   end
end

get '/account' do
  erb :account
end

post '/account' do
  avatar_url = params['avatar_url']
  user = User.find_by(id: session[:user].id)
  user.avatar_url = avatar_url
  user.save
  redirect '/'
end

get '/logout' do
  session[:user] = nil
  p 'user has logged out'
  redirect '/'
end

get '/post' do
  erb :post
end

post '/post' do
  post = Post.new(
    user_id: session[:user].id,
    title: params['title'],
    image_url: params['image_url'],
    body: params['body']
  )
  post.save
  this_post = Post.find_by(id: post.id)
  tag = Tag.new(
    post_id: this_post.id
  )
  tag.save
  redirect '/'
end

require './models'

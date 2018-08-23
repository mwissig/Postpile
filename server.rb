require 'sinatra'
require 'sinatra/activerecord'
require 'faker'
require 'securerandom'
enable :sessions

configure :development do
  set :database, 'sqlite3:rumblr.sqlite3'
end

configure :production do
  require 'active_record'
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end

get '/' do
  @users = User.all
  @posts = Post.all
    @comments = Comment.all
  erb :home
end

post '/' do
  post_id = params['id']
  post = Post.find_by(id: post_id)
  post.likes += 1
  post.save
  redirect '/'
end

get '/posts/:id' do
  @id = params[:id]
  @users = User.all
  @posts = Post.all
  @comments = Comment.all
  erb :posts
end

delete '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end

get '/users/:id' do
  @id = params[:id]
  @users = User.all
  @posts = Post.all
  @follows = Follow.all
  erb :users
end

post '/users/:id/follow' do
  follow = Follow.new(
    follower_id: session[:user].id,
    followed_id: params[:id]
  )
  follow.save
  redirect '/account'
end

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
    password: params['password'],
    first_name: params['first_name'],
    last_name: params['last_name'],
    birthday: params['birthday']
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
  @users = User.all
  @posts = Post.all
  @follows = Follow.all
    @comments = Comment.all
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
    body: params['body'],
    likes: 0
  )
  post.save
  redirect '/'
end

post '/posts/:id/comment' do
  @post = Post.find(params[:id])
  comment = Comment.new(
    post_id: @post.id,
    user_id: session[:user].id,
    message: params['message']
  )
  comment.save
  redirect "/posts/#{@post.id}"
end

get '/deleteme' do
  erb :deleteme
end

delete '/deleteme/delete' do
  @posts = Post.all

  @current_user = User.find(session[:user].id)
  @current_user.destroy
  session.clear
  redirect '/logout'
end

require './models'

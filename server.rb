require 'sinatra'
require 'sinatra/activerecord'
require 'faker'
require 'securerandom'
enable :sessions

set :database, 'sqlite3:name-email-password.sqlite3'

get '/' do
  @users = User.all
  erb :home
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
    name: params['fullname'],
    password: params['password']
  )
  user.save
  redirect '/'
end

post '/login' do
  email = params['email']
  given_password = params['password']
  user = User.find_by(email: email)
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

get '/logout' do
  session[:user] = nil
  p "user has logged out"
  redirect '/'
end

require './models'

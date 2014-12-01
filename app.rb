require 'sinatra'
require 'sinatra/activerecord'
require './environments'


class User < ActiveRecord::Base
end


get '/' do
  @users = User.order('login ASC')
  erb :'users/index'
end

get '/users/create' do
  @user = User.new
  erb :'users/create'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "users/#{@user.id}"
  else
    erb :'users/create'
  end
end

get '/users/edit/:id' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

post '/users/edit/:id' do
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    redirect "users/#{@user.id}"
  else
    erb :'users/edit'
  end
end

get '/users/kill/:id' do
  @user = User.find(params[:id])
  if @user.destroy
    redirect '/'
  else
    erb :'users/edit'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/view'
end

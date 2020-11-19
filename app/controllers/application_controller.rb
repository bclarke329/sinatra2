require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "skinzLogs*"
  end

  get "/" do 
    erb :home
  end 

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
    # session[:user_id] = user.id
    if @user.save
      redirect '/sessions/login'
    else 
      redirect '/failure'
    end 
    # session[:user_id] = @user.id
    # erb :signup
  end 

  get '/users/home' do 
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end

  get '/sessions/login' do 
    erb :'/sessions/login'
  end 

  post '/sessions/login' do 
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      
        redirect '/users/home'
    else
      redirect '/failure'
    end
  end 

  get '/sessions/logout' do 
    session.clear
    # binding.pry 
    erb :'/sessions/logout'
  end 

  get '/failure' do 
    erb :'/failure'
  end

end

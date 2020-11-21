class UsersController < ApplicationController

    get "/signup" do
        erb :signup
    end
    
    post "/signup" do
        @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
        # session[:user_id] = user.id
        if @user.save
          redirect '/users/login'
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
    
    get '/users/login' do 
        erb :'/users/login'
    end 
    
    post '/users/login' do 
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          
            redirect '/users/home'
        else
          redirect '/failure'
        end
    end 


  get '/users/logout' do 
    session.clear
    erb :'/users/logout'
  end 

  get '/failure' do 
    erb :'/failure'
  end


end 
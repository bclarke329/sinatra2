require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "skinzLogs*"
  end

  get "/" do
    if logged_in? 
      redirect to '/users/home'
    else
      erb :home
    end
  end 

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
  end 
end

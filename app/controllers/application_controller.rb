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

  helpers do

    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
  end 
end

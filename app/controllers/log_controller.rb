class LogController < Sinatra::Base
    
    get 'users/create_log' do 
         erb :'/users/create_log'
    end 
    
    post '/users/create_log' do 
        @log = Log.new(:current_condition => params[:current_condition], :new_products => params[:new_products], :list_products => params[:list_products], :comments => params[:comments])
        @log.save 
        redirect '/users/home'
        binding.pry
    end 
end 

class LogController < ApplicationController
    
    get '/logs' do 
        @logs = Log.all
        erb :'/logs/index'
    end

    get '/logs/new' do 
         erb :'/logs/create_log'
    end 
    
    post '/logs' do 
        @log = Log.new(:current_condition => params[:current_condition], :new_products => params[:new_products], :list_products => params[:list_products], :comments => params[:comments])
        @log.save 
        # binding.pry
        redirect "/logs"
    end 

    # get '/logs/:id' do 
    #     displays one log based on id in the url
    # end 

    # get '/logs/:id/edit' do 
    #     displays edit form based on ID in url
    # end 

    # patch '/logs/:id' do 
    #     modifies an existing log based on id in the URL
    # end

    # put '/logs/:id' do 
    #     replaces an existing log
    # end 

    # delete '/logs/:id' do 
    #     deletes a log baed on the id in the url
    # end 
end 

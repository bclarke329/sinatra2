class LogController < ApplicationController
    
    get '/logs' do #index
    if is_logged_in?
        @logs = Log.all
        erb :'/logs/index' 
    else
        redirect '/signup'
        end
    end

    get '/logs/new' do #new
    if is_logged_in?
         erb :'/logs/new'
    else
        "Sorry, you must be signed in to start logging."
        end
    end 
    
    post '/logs' do #create
    if is_logged_in?
        @log = Log.new(:current_condition => params[:current_condition], :new_products => params[:new_products], :list_products => params[:list_products], :comments => params[:comments])
        @log.save 
        # binding.pry
        redirect "/logs/index"
        end 
    end 

    get '/logs/:id' do 
       @log = current_user.logs.find(params[:id])
       erb :'/logs/show'
    end 

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

class LogController < ApplicationController
    
    get '/logs' do #index
            @logs = Log.all
            # binding.pry
            erb :'/logs/index' 
    end

    get '/logs/:id' do #show
        @log = Log.find_by_id(params[:id])
        if @log
            erb :'/logs/show'
        else
            "That log does not exist"
        end 
    end 
 
    get '/logs/new' do #new, shows form 
             erb :'/logs/new'
        end 
    
    post '/logs' do #create the new instance 
        @log = Log.create(:current_condition => params[:current_condition], :new_products => params[:new_products], :list_products => params[:list_products], :comments => params[:comments])
        @log.user_id = current_user.id
        if @log.save 
        redirect to "/logs/#{@log.user_id}"   
        else
            erb :"logs/new"   
            end
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

class LogController < ApplicationController
    
    get '/logs' do #index
            @logs = Log.all
            # binding.pry
            erb :'/logs/index' 
    end

    get '/logs/new' do #new, shows form 
        erb :'logs/new'
    end 
    

    get '/logs/:id' do #show
        @log = Log.find_by_id(params[:id])
        if @log
            erb :'/logs/show'
        else
            erb :'/failure'
        end 
    end 
 
  
    post '/logs' do #create 
        @log = Log.create(params)
        # @log.user_id = current_user.id
        if @log.save 
        redirect to "/logs/#{@log.id}"   
        else
            erb :"logs/new"   
        end
    end 

    get '/logs/:id/edit' do 
        @log = Log.find_by_id(params[:id])
          erb :'/logs/edit' 
    end 

    patch '/logs/:id' do 
        log = Log.find_by_id(params[:id])
        log.update(params[:current_condition])
        log.update(params[:new_product])
        log.update(params[:list_product])
        log.update(params[:comment])
        log.save
        # binding.pry
        redirect to "/logs/#{log.id}"  
    end

    delete '/logs/:id' do #destory
        log = Log.find_by_id(params[:id])
        log.destroy
        redirect to '/logs'
    end 
end 

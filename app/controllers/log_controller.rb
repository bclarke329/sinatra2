class LogController < ApplicationController
    
    get '/logs' do #index
        if logged_in?
            @logs = Log.where(:user_id => current_user.id)
            @sorted_logs = @logs.order("created_at DESC")
            erb :'/logs/index'  
        else
            erb :'signin_failure'
        end
    end

    get '/logs/new' do #new, shows form 
    if logged_in?
        erb :'logs/new'
    else
        erb :'signin_failure'
        end
    end 
    
    
    get '/logs/:id' do #show
        @log = Log.find_by_id(params[:id])
        if @log.user_id == current_user.id
            erb :'/logs/show'
        else
            erb :'not_authorized'    
        end 
    end 
 
  
    post '/logs' do #create 
        if logged_in?
        @log = Log.create(params)
        @log.user_id = current_user.id
            if @log.save 
                redirect to "/logs/#{@log.id}"   
            else
            erb :"logs/new"  
            end  
        end
    end 

    get '/logs/:id/edit' do 
        if logged_in?
            @log = Log.find_by_id(params[:id])
            if @log.user_id == current_user.id
            erb :'/logs/edit' 
            else
            erb :'not_authorized' 
            end 
        end 
    end 

    patch '/logs/:id' do #edit
        log = Log.find_by_id(params[:id])
        if log.user_id == current_user.id
        # log.update(current_condition: params[:current_condition])
        # log.update(new_products: params[:new_products])
        # log.update(list_products: params[:list_products])
        # log.update(comments: params[:comments])
        log.update(current_condition: params[:current_condition], new_products: params[:new_products], list_products: params[:list_products], comments: params[:comments] )
        log.save
        redirect to "/logs/#{log.id}" 
        else 
        erb :'not_authorized' 
        end 
    end

    delete '/logs/:id' do #destory
        log = Log.find_by_id(params[:id])
        if log.user_id == current_user.id
        log.destroy
        redirect to '/logs'
        else  
            erb :'not_authorized'
        end 
    end 


end 

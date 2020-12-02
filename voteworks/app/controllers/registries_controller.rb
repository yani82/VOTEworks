class RegistryController < ApplicationController

    # differentiates registry based on new election 
    # user logged in to check their own registeries as well as different public registries with limited info ie how many 'returns how many registeries there are'

    get '/registries' do 
        @registries = current_user.registries 
        erb :"registry/index"  
    end 

    get '/registries/new' do 
        # Checking if they are logged in 
        if !logged_in?
            redirect '/login' # Redirecting if they aren't
        else
            erb :"registry/new"
        end 
    end 

    get '/registries/:id' do 
        # "Get the id from the params hash and look in the database for a registry with that id and then save it to a @ variable and render an erb"
        @registry = Registry.find(params[:id]) 
        if @registry.user && session[:user_id] == @registry.user.id 
            erb :'/registry/show'
        else 
            redirect '/users'
        end
    end 

    post '/registries' do 
        if !logged_in?
            redirect '/login' # Redirecting if they aren't
        else 
            registry = current_user.registries.create(params) # create saves it, new doesn't, helper method: current_user is the instance of that user class and is calling on all the registries
        redirect '/registries'
        end
    end

    get '/registries/:id/edit' do
        # Checking if user is logged in
        @registry = Registry.find(params[:id]) 
        if !logged_in? 
            redirect '/login'
        elsif @registry.user && session[:user_id] == @registry.user.id 
            # "An edit registration form #{current_user.id} is editing #{registry.id}" # rendering = when current request has data we need
            erb :"/registry/edit"
        else 
            redirect "/registries" # redirect = if we don't need data anymore
        end 
    end 

    patch '/registries/:id' do
        params.delete("_method") 
        params.delete_if {|key, value| value.empty?} 
        @registry = Registry.find(params[:id])
        @registry.update(params) 
        redirect "/registries"
    end
    
      delete '/registries/:id/delete' do
        @registry = Registry.find(params[:id])
        if @registry
        @registry.delete
        redirect '/registries'
        else 
            redirect '/registries'
        end
      end 
end
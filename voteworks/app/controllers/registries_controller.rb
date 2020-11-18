class RegistryController < ApplicationController

    # differentiates registry based on new election 
    # user logged in to check their own registeries as well as different public registries with limited info ie how many 'returns how many registeries there are'

    get '/registries' do 
        # "You are logged in as #{session[:email]}"
        # binding.pry
        @registries = current_user.registries 
        erb :"registry/index"  
    end 

    # shows all registeries 
    # post '/registries' do
    #     "Get all registry records from database"
    #     @registries = Registry.all
    #     erb :"users/index" # or show?
    # end 

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
        erb :'/registry/show' 
    end 

    post '/registries' do
        if !logged_in?
            redirect '/login' # Redirecting if they aren't
        else 
            # @registry = Registry.create(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], address_line_2: params[:address_line_2], city: params[:city], state: params[:state], zipcode: params[:zipcode], country: params[:country])
    #     if User.all.map{|u| u.username}.include?(params[:username])
    #     redirect :'/registry/show'
    # end
        registry = current_user.registries.create(params) # create saves it, new doesn't, helpder method: current_user is the instance of that user class and is calling on all the registries
        # binding.pry
        redirect "registries/#{registry.id}"
        # else 
            # redirect 'registries/new'
        end
    end

    get '/registries/:id/edit' do
        # Checking if user is logged in
        @registry = Registry.find(params[:id]) 
        if !logged_in?
            redirect '/login'
        elsif @registry 
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
        # @registry = Registry.find(params[:id]).first_name # or username? 
        Registry.find(params[:id]).destroy
        # erb :"delete" # add delete.erb in views/registry?
        redirect '/registries'
      end 
end
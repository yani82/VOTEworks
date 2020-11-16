class RegistryController < ApplicationController

    # differentiates registry based on new election 
    # user logged in to check their own registeries as well as different public registries with limited info ie how many 'returns how many registeries there are'

    get '/registries' do 
        # "You are logged in as #{session[:email]}"
        # binding.pry
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
        registry = Registry.new(params)
        if registry.save
        # user = User.create(params[:first_name], params[:last_name], params[:address], params[:address_line_2], params[:city], params[:state], params[:zipcode], params[:country])
        # session[:user_id] = user.id
        # redirect "/users/#{user.slug}"
        redirect "registries/#{registry.id}"
        else 
            redirect 'registries/new'
        end
    end
    end

    get '/registries/:id/edit' do
        # Checking if user is logged in
        @registries = Registry.find_by(params[:id]) 
        if !logged_in?
            redirect '/login'
        else
            if @registries 
            "An edit registration form #{current_user.id} is editing #{registry.id}" # rendering = when current request has data we need
        else 
            redirect "/registry" # redirect = if we don't need data anymore
        end 
        end 
    end 

    patch '/registries/:id' do
        Registry.find(params).save
        redirect '/users'
    end
    
      delete '/registries/:id/delete' do
        # @registry = Registry.find(params[:id]).first_name # or username? 
        Registry.find(params[:id]).destroy
        # erb :"delete" # add delete.erb in views/registry?
        redirect '/registries'
      end 
end
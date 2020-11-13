class RegistryController < ApplicationController 

    # differentiates registry based on new election 
    # user logged in to check their own registeries as well as different public registries with limited info ie how many 'returns how many registeries there are'

    get '/registries' do # change to plural 
        "You are logged in as #{session[:email]}"
        erb :"users/index" # create a index view page under registry with edit & delete button 
    end 

    # shows all registeries 
    get '/registries' do
        "Get all registry records from database"
        @registries = Registry.all
        erb :"users/index" # show?
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
        erb :"registry/show"
    end 

    post '/registries' do
        "testing"
        # binding.pry
        # if !logged_in?
        #     redirect '/login' # Redirecting if they aren't
        # else 
        #     @registry = Registry.create(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], address_line_2: params[:address_line_2], city: params[:city], state: params[:state], zipcode: params[:zipcode], country: params[:country])
        #     redirect "/registry"
        # end 
    end

    get '/registries/:id/edit' do
        # Checking if user is logged in
        if !logged_in?
            redirect "/login"
        else
            if registry = current_user.registry.find_by(params[:id])
            "An edit registration form #{current_user.id} is editing #{registry.id}" # rendering = when current request has data we need
        else 
            redirect "/registry" # redirect = if we don't need data anymore
        end 
        end 
    end 

    patch '/registries/:id' do
        Registry.find(params[:id]).update(first_name:params['first_name'],last_name: params['last_name'], address: params['address'], address_line_2: params['address_line_2'], city: params['city'], state: params['state'], zipcode: params['zipcode'], country: params['country']).save
        # binding.pry
        redirect_to :"users/show"
      end
    
      delete '/registries/:id/delete' do
        # @registry = Registry.find(params[:id]).first_name # or username? 
        Registry.find(params[:id]).destroy
        # erb :"delete" # add delete.erb in views/registry?
        redirect '/registries'
      end 
    
end
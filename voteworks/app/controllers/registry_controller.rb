class RegistryController < ApplicationController 

    # differentiates registry based on new election 
    # user logged in to check their own registeries as well as different public registries with limited info ie how many 'returns how many registeries there are'

    get '/registry' do
        "You are logged in as #{session[:email]}"
        erb :"users/index" # create a index view page under registry with edit & delete
    end 

    get '/registry/new' do 
        # Checking if they are logged in 
        if !logged_in?
            redirect '/login' # Redirecting if they aren't
        else
            erb :"registry/new"
        end 
    end 

    post '/registry' do 
        if !logged_in?
            redirect '/login' # Redirecting if they aren't
        else 
            @registry = Registry.create(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], address_line_2: params[:address_line_2], city: params[:city], state: params[:state], zipcode: params[:zipcode], country: params[:country])
            redirect '/registry'
        end 
    end

    get '/registry/:id/edit' do
        # Checking if user is logged in
        if !logged_in?
            redirect "/login"
        else
            if registry = current_user.registry.find_by(params[:id])
            "An edit registration form #{current_user.id} is editing #{registry.id}" # rendering = when current request has data we need
        else 
            redirect '/registry' # redirect = if we don't need data anymore
        end 
        end 
    end 

end 
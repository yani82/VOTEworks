class RegistryController < ApplicationController 

    get '/registry' do 
        "You are logged in as #{session[:email]}"
    end 

    get '/registry/new' do 
        # Checking if they are logged in 
        if !logged_in?
            redirect '/login' # Redirecting if they aren't
        else
            "A new registration form" # Rendering if they are
        end 
    end 

    get '/registry/:id/edit' do
         if !logged_in?
            redirect '/login'
        else
            "An edit registration form"
        end 
    end 

end 
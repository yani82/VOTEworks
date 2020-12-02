require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' 
    enable :sessions
    set :session_secret, 'password_security' 
  end

  get "/" do
    erb :welcome
  end

  helpers do # can be used across controllers 

    def logged_in? 
      !!session[:user_id] # double negation
      # checks if a session exists with this user id and returns true or false 
    end 

    def current_user
      @current_user = User.find(session[:user_id]) # who the user is?
    end 

    def logout!
      session.clear 
    end 

  end 

end

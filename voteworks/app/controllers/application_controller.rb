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
      # instead of !!current_user
    end 

    def current_user
      @current_user = User.find(session[:user_id])
    end 

    # def login(email, password)
    #   # Authentication
    #   user = User.find_by(:email => email) # missing params[:]?
    #     if user && user.authenticate(password)
    #     session[:email] = user.email
    #   else 
    #     redirect '/login'
    #   end 
    # end 

    def logout!
      session.clear 
    end 

  end 

end

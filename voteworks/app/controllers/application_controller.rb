require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' 
    enable :sessions
    set :session_secret, 'password_security' 
  end

  get "/" do
    session[:greeting] = "Hello World"
    'Hello, World!'
    # erb :welcome
  end

  helpers do # can be used across controllers

    def logged_in? 
      !!current_user # double negation
    end 

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
    end 

    def login(email, password)
      # Authentification
      user = User.find_by(:email => email) 
        if user && user.authenticate(password)
        session[:email] = user.email
      else 
        redirect '/login'
      end 
    end 

    def logout!
      session.clear 
    end 

  end 

end

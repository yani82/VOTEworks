class SessionsController < ApplicationController

    get '/login' do
        erb :"/sessions/login.html"
    end 

    post '/sessions' do 
        # raise params.inspect
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        redirect '/registries'
        else 
            redirect '/login'
        end 
    end 

    get '/logout' do 
        logout! 
        redirect '/login' # or /welcome
    end 

end 
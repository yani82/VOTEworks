class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end 

    post '/sessions' do 
        # raise params.inspect
        login(params[:email])
        redirect '/registry'
    end 

    get '/logout' do 
        logout! 
        redirect '/registry'
    end 

end 
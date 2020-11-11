class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end 

    post '/sessions' do 
        # raise params.inspect
        login(params[:email], params[:password])
        redirect '/registry'
    end 

    get '/logout' do 
        logout! 
        redirect '/login' # previously, /registry
    end 

end 
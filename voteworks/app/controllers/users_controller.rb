class UsersController < ApplicationController 

    get '/register' do
        erb :"users/new.html"
    end 

    post '/users' do 
        @user = User.new 
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else 
            erb :"users/new.html" # redirect '/register'
        end 
    end 

end 
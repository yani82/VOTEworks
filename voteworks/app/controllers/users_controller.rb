class UsersController < ApplicationController 

    get '/register' do
        erb :"users/new.html"
    end 

    post '/users' do 
        @user = User.new 
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.address = params[:address]
        if @user.save
            redirect '/login'
        else 
            erb :"users/new.html" # redirect '/register'
        end 
    end 

end 
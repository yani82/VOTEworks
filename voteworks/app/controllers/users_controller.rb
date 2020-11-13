class UsersController < ApplicationController 

    get '/register' do
        erb :"users/new.html"
    end 

    get '/users' do
        erb :"users/index"
    end

    post '/users' do
        @user = User.new
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            erb :"users/index"
        else 
            erb :"users/new.html"
        end 
    end 

end 
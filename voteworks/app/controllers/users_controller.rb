class UsersController < ApplicationController 

    get '/signup' do
        erb :"users/new.html"
    end 

    get '/users' do
        erb :"users/index"
    end

    post '/users' do
        user = User.new(params)
        if user.save 
            session[:user_id] = user.id 
            erb :'/users/index'
        else
            redirect '/signup'
        end 
    end 

end 
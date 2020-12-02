class UsersController < ApplicationController 

    get '/signup' do
        erb :"users/new.html"
    end 

    post '/signup' do
        if params[:username] == "" || params[:password] == "" || params[:email] == "" #=> Every field has to be filled out. Have to check for duplicates later
            # @error = "Must include email and password" 
            redirect "/signup"
        elsif !!User.find_by(username: params[:username]) || !!User.find_by(email: params[:email]) 
            redirect "/signup"
        else
            user = User.create(username: params[:username], password: params[:password], email: params[:email])
            session[:user_id] = user.id
            erb :"/users/index"
        end
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
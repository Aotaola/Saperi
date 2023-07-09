class SessionsController < ApplicationController

    def new

    end
    def create

        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Login successful"
            redirect_to user
        else
            flash[:error] = "something went wrong"
            render :new
        end

    end
    def destroy
        reset_session
        flash[:notice] = "you have been logged out"
        redirect_to root_path
    end


end

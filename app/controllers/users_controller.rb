class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def show  
        @sources = @user.sources
        @collections = @user.collections
        if current_user != @user
            redirect_to login_path
         end
    end

    def edit 
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: "Your profile was successfully updated"
        else 
            flash[:alert] = "Sorry, there was an error has occurred while updating"
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path, notice: "@#{@user.name.capitalize} was successfully deleted"
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to @user, notice: "User was successfully created"
        else
            flash[:alert] = "there was an error creating the user"
            render :new
        end
    end
    
    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :avatar, :bio, :password)
    end
end

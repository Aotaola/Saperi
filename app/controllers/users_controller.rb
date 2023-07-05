class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: "User was successfully created"
        else
            flash[:alert] = "there was an error creating the user"
            redirect_to :new
        end
    end
    def new
        @user = User.new
    end
    def index
        users = User.all
        render users
    end
    def show

    end
    def edit

    end
    def update
        if @user.update(user_params)
            redirect_to @user, notice: "@#{@user.name.capitilize} was successfully updated"
        else 
            flash[:alert] = "@#{@user.name.capitilize},an error has occurred while updating"
            redirect_to :edit
        end
    end
    def destroy
        @user.destroy
        redirect_to root_path, notice: "@#{@user.name.capitilize} was successfully deleted"
    end
    
    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :avatar, :bio, :password)
    end
    
end

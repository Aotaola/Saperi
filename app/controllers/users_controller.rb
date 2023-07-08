class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index
        @users = User.all
        @users
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
            render :edit
        end
        uploaded_file = params[:avatar]
        file_path = Rails.root.join
    end

    def destroy
        @user.destroy
        redirect_to root_path, notice: "@#{@user.name.capitilize} was successfully deleted"
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
        params.require(:user).permit(:id, :name, :email, :avatar, :bio, :password)
    end
    
end

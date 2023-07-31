class UserForumsController < ApplicationController
    before_action :set_forum, only: [:show, :destroy, :create, :new]
    before_action :set_user_forum, only: [:create, :new]

    def show
    end
    def index
    end
    def new

    end
    def create

        if @user_forum.save
            redirect_to @user_forum,
            notice: 'You have added this forum to your profile'
        else
            redirect_to @user_forum,
            alert: 'something went wrong'
        end

    end
    def destroy

    end

    private

    def set_forum
       @forum = Forum.find(params[:forum_id])
       Rails.logger.debug "@forum = #{@forum.inspect}"
    end
    def set_user_forum
        Rails.logger.debug "params[:forum_id] = #{params[:forum_id].inspect}"
        @user_forum = UserForum.create(user_id: current_user.id, forum_id: @forum.id)
    end


end

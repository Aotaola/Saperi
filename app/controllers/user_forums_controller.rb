class UserForumsController < ApplicationController
    before_action :set_forum, only: [:show, :destroy, :create, :new]
    before_action :set_user_forum, only: [:create]

    def show

    end
    def index
        @user_forums = Userforums.all
        render @user_forums
    end
    def new

    end
    def create

        if @user_forum.save
            redirect_to @forum,
            notice: 'You have added this forum to your profile'
        else
            redirect_to @forum,
            alert: 'something went wrong'
        end

    end
    def destroy

    end

    private

    def set_forum
       @forum = forum.find(params[:forum_id])
       Rails.logger.debug "@forum = #{@forum.inspect}"
    end
    def set_user_forum
        Rails.logger.debug "params[:forum_id] = #{params[:forum_id].inspect}"
        @user_forum = Userforum.new(user: current_user, forum: @forum)
    end


end

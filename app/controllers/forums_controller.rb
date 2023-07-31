class ForumsController < ApplicationController
    before_action :set_forum, only: [:show]

    def show
        @users = @forum.users.includes(:sources)
        @collection_sources = @forum.collection.collection_source.sources.includes(source: :user)
    end

    def create
        if @forum.save
            UserForum.create(user_id: current_user.id, forum_id: @forum.id)
        else
            alert: "An error occurred"
        end
        
    end

    private 

    def set_forum
        @forum = Forum.find(params[:id])
    end

    def forum_params
        params.require(:forum).permit(:id)
    end
    
end

class ForumsController < ApplicationController
    before_action :set_forum, only: [:show]

    def show 

    end
    def create
        
    end

    private 

    def set_forum
        @forum = Forum.find(params[:id])
    end

    def forum_params
        params.require(:forum).permit(:id)
    end
    
end

class SourcesController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update] 

    def show 

    end
    def edit

    end
    def update
        if @source.update
            notice "Source has been updated"
        else
            flash[:error] = "Error updating source"
            render :edit
        end
    end
    def destroy
        @source.destroy
        redirect_to :user_path, notice: "Source has been deleted"
    end

    private 

    def set_forum
        @forum = Forum.find(params[:id])
    end

    def forum_params
        params.require(:forum).permit(:id)
    end
    
end

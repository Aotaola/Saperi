class SourcesController < ApplicationController
    
    before_action :set_source, only: [:show, :edit, :update] 

    def show 
        @sources = Source.all
        @sources
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

    def set_source
        @source = Source.find(params[:id])
    end

    def source_params
        params.require(:source).permit(:id, :link, :description)
    end
    
end

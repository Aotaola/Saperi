class SourcesController < ApplicationController
    before_action :set_source, only: [:show, :edit, :update]

    def show

    end
    def edit

    end
    def update
        if @source.update
            notice 'Source updated successfully'
        else
            flash[:error] = "error while updating source"
            render :edit
        end
    end
    def create
        @source = Source.create(source_params)
            if @source.save
                notice 'Source was successfully created'
            else
                flash[:error] = 'an error occurred while creating'
                flash[:notice] = source.errors.full_messages.to_sentence
            end
    end

    private

    def set_source
        @source = Source.find(params[:id])
    end

    def source_params
        params.require(:source).permit(:id, :description, :link)
    end
    
end

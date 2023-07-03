class SourcesController < ApplicationController

    private

    def source_params
        params.require(:source).permit(:id, :description, :link)
    end
    
end

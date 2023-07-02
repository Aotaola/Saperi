class CollectionsController < ApplicationController

    before_action :set_collection, only: [:show, :update]


    def index
        @collections = Collection.all
    end
    def show 

    end
    def edit

    end
    def update
        if @collection.update(collection_params)
            redirect_to @collection, notice: 'Collection updated successfully.'
        else 
            render :edit
        end
    end

    private 

    def set_collection
        @collection = Collection.find(params[:id])
    end
    def collection_params
        Collection.find(params[:id])
    end

end

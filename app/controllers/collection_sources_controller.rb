class CollectionSourcesController < ApplicationController
    before_action :set_collection, only: [:create, :new]
    before_action :set_source, only: [:create]
    before_action :set_collection_source, only: [:index]

    def show
      @collection_source = CollectionSource.find(params[:id])
    end
    def index

    end
    def new
        @collection = Collection.find(params[:collection_id])
        @collection_source = CollectionSource.new
    end
    def create
        @collection = Collection.find(params[:collection_id])
        @source = Source.find(params[:source_id]) 
        @collection_source = CollectionSource.new(source: @source, collection: @collection)
      
        if @collection_source.save
          redirect_to @collection, notice: 'Source was successfully added to collection.'
        else
          render :new
        end
    end
    def destroy
      @collection_source = CollectionSource.find(params[:id])
      if @collection_source.destroy
        flash[:notice] = 'Source was successfully removed from collection.'
        else 
          flash[:alert] = 'there was an error'
        end
        redirect_back(fallback_location: root_path)
    end
    
    private
    
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end
    def set_source
      @source = Source.find(params[:source_id]) 
    end
    def set_collection_source
      @collection_source = CollectionSource.find(params[:id])
    end
    
end
  
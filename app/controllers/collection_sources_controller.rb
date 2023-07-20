class CollectionSourcesController < ApplicationController
    before_action :set_collection, only: [:show, :destroy, :create, :new]
    before_action :set_source, only: [:create]
    
    def show
    end
    
    def index
      @collection_sources = CollectionSource.all
      render @collection_sources
    end
    
    def new
        @collection = Collection.find(params[:collection_id])
        @collection_source = CollectionSource.new
    end
    
    def create
        @collection = Collection.find(params[:collection_id])
        @source = Source.find(params[:source_id]) # You'll need to ensure source_id is being passed in the parameters
        @collection_source = CollectionSource.new(source: @source, collection: @collection)
      
        if @collection_source.save
          redirect_to @collection, notice: 'Source was successfully added to collection.'
        else
          render :new
        end
    end
    
    def destroy
    end
    
    private
    
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end
    
    def set_source
      @source = Source.find(params[:source_id]) 
    end
end
  
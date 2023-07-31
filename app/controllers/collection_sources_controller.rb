class CollectionSourcesController < ApplicationController
    before_action :set_collection, only: [ :destroy, :create, :new]
    before_action :set_source, only: [:create]
    def show
      @collection_source = CollectionSource.find(params[:id])
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
      @collection_source = CollectionSource.find(params[:id])
      
     if @collection_source.destroy
        redirect_back(fallback_location: root_path,
        notice: 'Source was successfully removed from collection.')
      else 
        flash[:alert] = 'there was an error',
        redirect_back(fallback_location: root_path)
      end
    end
    
    private
    
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end
    def set_source
      @source = Source.find(params[:source_id]) 
    end
    

end
  
class CollectionsController < ApplicationController

   before_action :set_collection, only: [:show, :edit, :update]

   def index 
      @collections = Collection.all
      @collections
   end
   def show
      
   end
   def edit
      
   end
   def update
      if @collection.update(@collection_params)
         redirect_to @collection, notice: "@#{@collection.title.capitilize} was successfully updated."
      else
         render :edit
      end
   end

   def destroy
      @collection.destroy
      redirect_to collections_path, notice: "@#{@collection.title.capitilize} was successfully deleted."
   end

   def new
      collection = Collection.new(collection_params)
         if collection.save
            redirect_to collection_path, notice: "Collection was successfully created"
         else
            flash[alert:] =  "there was an error creating the collection"
            redirect_to :new
         end
   end

    private 

      def set_collection
         @collection = Collection.find(params[:id])
      end
   
      def collection_params
          params.require(:collection).permit(:id, :title, :description, :image)
      end

end

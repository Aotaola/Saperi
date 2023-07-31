class CollectionsController < ApplicationController

   before_action :set_collection, only: [:show, :edit, :update]

   def index 
      @query = Collection.ransack(params[:q])
      @col = params[:q].blank? ? Collection.none : @query.result(distinct: true)
      @collections = Collection.paginate(page: params[:page], per_page: 10)
   end
    
   def show
      @forum = @collection.forum
      @users = @collection.users
      @user_collection = @collection.user_collections
      @collection_sources = @collection.collection_sources.includes(:source)
      @sources = @collection.sources.includes(:users)
   end
   
   def edit
      
   end
   def update
      if @collection.update(@collection_params)
         redirect_to @collection, notice: "@#{@collection.title.capitalize} was successfully updated."
      else
         render :edit
      end
   end

   def destroy
      @collection.destroy
      redirect_to collections_path, notice: "@#{@collection.title.capitalize} was successfully deleted."
   end
   def new
      @collection = Collection.new
   end

   def create
      @collection = Collection.new(collection_params)
      
         if @collection.save
            redirect_to @collection, notice: "Collection was successfully created"
         else
            flash[:alert] =  "there was an error creating the collection"
            render :new
         end
   end

    private 

      def set_collection
         @collection = Collection.find(params[:id])
      end
   
      def collection_params
          params.require(:collection).permit(:title, :description, :image)
      end

end

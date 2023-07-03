class CollectionsController < ApplicationController

   private 

   def collection_params
    params.require(:collection).permit(:id, :title, :description, :image)
   end

end

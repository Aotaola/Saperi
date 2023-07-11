class UserCollectionsController < ApplicationController
    before_action :set_collection, only: [:show, :destroy, :create]
    before_action :set_user_col

    def show

    end
    def index

    end
    def create
        if @user_col.save
            redirect @collection, notice: 'You have added this collection to your profile'
        else
            redirect @collection, notice: 'something went wrong'
        end
    end
    def destroy

    end

    private 
    def set_user_collection
        @user_col = UserCollection.new(user: current_user, collection: @collection)
    end
    def set_collection
       @collection = Collection.find(params[:collection_id])
    end
end

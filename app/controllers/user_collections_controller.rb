class UserCollectionsController < ApplicationController
    before_action :set_collection, only: [:show, :index, :destroy, :create]
    before_action :set_user_collection, only: [:create]

    def show

    end
    def index

    end
    def create
        if @user_collection.save
            redirect_to @collection,
            notice: 'You have added this collection to your profile'
        else
            redirect_to @collection,
            flash[:alert] = @user_col.errors.full_messages.to_sentence
        end
    end
    def destroy

    end

    private

    def set_collection
       @collection = Collection.find(params[:collection_id])
    end
    def set_user_collection
        @user_collection = UserCollection.new(user: current_user, collection: @collection)
    end

end

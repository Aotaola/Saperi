class UserCollectionsController < ApplicationController
    before_action :set_collection, only: [:show,  :destroy, :create, :new]
    before_action :set_user_collection, only: [:create]

    def show

    end
    def index
        @user_collections = UserCollections.all
        render @user_collections
    end
    def new

    end
    def create

        if @user_collection.save
            redirect_to @collection,
            notice: 'You have added this collection to your profile'
        else
            redirect_to @collection,
            alert: 'something went wrong'
        end

    end
    def destroy

    end

    private

    def set_collection
       @collection = Collection.find(params[:collection_id])
       Rails.logger.debug "@collection = #{@collection.inspect}"
    end
    def set_user_collection
        Rails.logger.debug "params[:collection_id] = #{params[:collection_id].inspect}"
        @user_collection = UserCollection.new(user: current_user, collection: @collection)
    end


end

class SourcesController < ApplicationController
    
    before_action :set_source, only: [:show, :edit, :update, :destroy]
 
    def show 
        @query = Collection.ransack(params[:q])
        @collection = params[:q].blank? ? Collection.none : @query.result(distinct: true)
    end
    def index
        @sources = Source.all
        @sources
    end
    def new
        @source = Source.new
    end
    def edit

    end
    def create
        @source = current_user.sources.build(source_params)
      
        if @source.save
          
          CollectionSource.create(collection_id: params[:collection_id], source_id: @source.id)
          redirect_to @source, notice: 'Source was successfully created.'
          
        else
          flash[:error] = 'Something went wrong'
          render :new
        end
    end
    def update
        if @source.update(source_params)
            redirect_to sources_path,
            notice: "Source has been updated"
        else
            flash[:error] = "Error updating source"
            render :edit
        end
    end
    def destroy
        @source.destroy
        redirect_to :user_path, notice: "Source has been deleted"
    end

    private 

    def set_source
        @source = Source.find(params[:id])
    end

    def source_params
        params.require(:source).permit(:link, :description)
    end
    
end

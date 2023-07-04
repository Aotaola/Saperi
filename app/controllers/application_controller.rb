class ApplicationController < ActionController::Base
    before_action :set_resource, only: [:show, :edit, :update, :destroy]


    def create
       resource = resource_class
        resource.create
    end
    def index 
        resources = resource_class.all
        instance_variable_set("@#{resource_name.pluralize}", resources)

    end
    def show

    end
    def edit

    end
    def update
        resource = instance_variable_set("@#{resource_name}")
        if resource.update(resource_params)
            redirect_to resource, notice: "@#{resource_name.capitilize} was successfully updated."
        else
            render :edit
        end
    end

    private 

    def set_resource
        resource = resource_class.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
    end
    def resource_name
        controller_name.singularize
    end
    def resource_class
        resource_name.classify.constantize
    end
    def resource_params
        raise notImplementedError
    end

end

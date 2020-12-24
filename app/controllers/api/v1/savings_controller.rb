class Api::V1::SavingsController < ApplicationController
    
    def index
        savings = Saving.all
        render :json => savings, each_serializer: SavingSerializer
    end
    
    def show
        saving = Saving.find(params[:id])
        render :json => saving, each_serializer: SavingSerializer
    end
    
    def create
        saving = Saving.create(saving_params)
        if saving.valid?
            render json: { saving: SavingSerializer.new(saving)}, status: :created
        else
            render json: { error: 'failed to create saving'}, status: :not_acceptable
        end
    end
    
    def update
        saving = Saving.find(params[:id])
        saving.update(saving_params)
        render :json => saving, each_serializer: SavingSerializer
    end
    
    def delete
        saving = Saving.find(params[:id])
        saving.destroy
        render {}
    end
    
    private

    def saving_params
        params.require(:saving).permit('fields')
    end
    
    
end

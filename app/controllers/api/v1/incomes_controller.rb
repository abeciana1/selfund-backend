class Api::V1::IncomesController < ApplicationController

    def index
        incomes = Income.all
        render :json => incomes, each_serializer: IncomeSerializer
    end
    
    def show
        income = Income.find(params[:id])
        render :json => income, each_serializer: IncomeSerializer
    end
    
    def create
        income = Income.create(income_params)
        if income.valid?
            render json: { income: IncomeSerializer.new(income)}, status: created
        else
            render json: { error: 'failed to create income'}, status: :not_acceptable
        end
    end
    
    def update
        income = Income.find(params[:id])
        income.update(income_params)
        render :json => income, each_serializer: IncomeSerializer
    end
    
    def delete
        income = Income.find(params[:id])
        income.destroy
        render {}
    end
    
    private
    
    def income_params
        params.require(:income).permit(:source_name, :amount, :rate, :user_id)
    end
    
    
end

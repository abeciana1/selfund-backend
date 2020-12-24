class Api::V1::ExpensesController < ApplicationController
    
    def index
        expenses = Expense.all
        render :json => expenses, each_serializer: ExpenseSerializer
    end
    
    def show
        expense = Expense.find(params[:id])
        render :json => expense, each_serializer: ExpenseSerializer
    end
    
    def create
        expense = Expense.create(user_params)
        if expense.valid?
            render json: { expense: ExpenseSerializer.new(expense)}, status: :created
        else
            render json: { error: 'failed to create expense' }, status: :not_acceptable
        end
    end
    
    def update
        expense = Expense.find(params[:id])
        expense.update(expense_params)
        render :json => expense, each_serializer: ExpenseSerializer
    end
    
    def delete
        expense = Expense.find(params[:id])
        expense.destroy
        render {}
    end
    
    private
    
    def expense_params
        params.require(:expense).permit(:source_name, :rate, :amount, :user_id)
    end
    
    
end

class Api::V1::GoalsController < ApplicationController
    
    def index
        goals = Goal.all
        render :json => goals, each_serializer: GoalSerializer
    end
    
    def show
        goal = Goal.find(params[:id])
        render :json => goal, each_serializer: GoalSerializer
    end
    
    def create
        goal = Goal.create(goal_params)
        if goal.valid?
            render json: { goal: GoalSerializer.new(goal) }, status: created
        else
            render json: { error: 'failed to create goal' }, status: :not_acceptable
        end
    end
    
    def update
        goal = Goal.find(params[:id])
        goal.update(goal_params)
        render :json => goal, each_serializer: GoalSerializer
    end
    
    def delete
        goal = Goal.find(params[:id])
        goal.destroy
        render {}
    end
    
    private
    
    def goal_params
        params.require(:goal).permit(:name, :goal_amount, :description, :user_id)
    end
    
end

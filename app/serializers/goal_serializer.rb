class GoalSerializer < ActiveModel::Serializer
    attributes :id, :name, :goal_amount, :description, :user_id
    has_one :user
end
class ExpenseSerializer < ActiveModel::Serializer
    attributes :id, :source_name, :rate, :amount, :user_id, :created_at
    has_one :user
end
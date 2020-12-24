class ExpenseSerializer < ActiveModel::Serializer
    attributes :id, :source_name, :rate, :amount, :user_id
    has_one :user
end
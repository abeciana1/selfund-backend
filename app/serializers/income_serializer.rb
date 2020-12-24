class IncomeSerializer < ActiveModel::Serializer
    attributes :id, :source_name, :amount, :rate, :user_id
    has_one :user
end
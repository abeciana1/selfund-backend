class SavingSerializer < ActiveModel::Serializer
    attributes :id, :name, :bank_name, :amount, :category, :user_id
    has_one :user
end
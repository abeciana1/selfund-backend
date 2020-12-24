class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email
    has_many :expenses
    has_many :goals
    has_many :incomes
    has_many :savings
end
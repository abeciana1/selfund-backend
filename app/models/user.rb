class User < ApplicationRecord
    has_many :expenses
    has_many :goals
    has_many :incomes
    has_many :savings
end

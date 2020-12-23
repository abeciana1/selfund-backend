class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :source_name
      t.float :amount
      t.string :rate
      t.integer :user_id
      t.timestamps
    end
  end
end

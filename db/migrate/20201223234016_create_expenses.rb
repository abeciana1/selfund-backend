class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :source_name
      t.string :rate
      t.float :amount
      t.integer :user_id
      t.timestamps
    end
  end
end

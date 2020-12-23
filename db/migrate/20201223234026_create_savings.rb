class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.string :name
      t.string :bank_name
      t.float :amount
      t.string :category
      t.integer :user_id
      t.timestamps
    end
  end
end

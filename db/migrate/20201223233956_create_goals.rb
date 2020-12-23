class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.float :goal_amount
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end

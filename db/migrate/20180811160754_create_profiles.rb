class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :number, null: false
      t.string :college, null: false
      t.string :school, null: false
      t.integer :user_id, null: false
      t.integer :age, null: false
      t.string :work, null: false

      t.timestamps :null => true
    end
  end
end

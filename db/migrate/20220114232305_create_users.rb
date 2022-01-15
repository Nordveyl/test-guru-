class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false 
      t.string :second_name, null: false 
      t.timestamps
    end
  end
end

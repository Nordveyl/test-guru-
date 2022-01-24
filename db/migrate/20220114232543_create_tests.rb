class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 1
      t.references :category, null: false, foreign_key: true 
      t.references :author, null: false, foreign_key: {to_table: :users} 
      t.timestamps 
    end
    add_index :tests [:level, :title], unique: true 
  end
end

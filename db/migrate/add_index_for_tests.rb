class AddIndexForTests < ActiveRecord::Migration[7.0]
  def change
    add_index :tests [:level, :title], unique: true 
  end 
end     
class NotesChangeText < ActiveRecord::Migration[5.0]
	
  def change
  	add_column :users, :notes, :text
    
  end
end

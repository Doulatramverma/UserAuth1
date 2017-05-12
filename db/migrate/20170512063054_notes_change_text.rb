class NotesChangeText < ActiveRecord::Migration[5.0]
	add_column :users, :notes, :text
    
  def change
  end
end

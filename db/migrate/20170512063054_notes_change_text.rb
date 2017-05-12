class NotesChangeText < ActiveRecord::Migration[5.0]
	change_column :users, :notes, :text
    
  def change
  end
end

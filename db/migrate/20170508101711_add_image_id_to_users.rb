class AddImageIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_id, :integer
  end
end

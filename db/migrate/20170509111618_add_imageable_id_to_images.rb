class AddImageableIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :imageable_id, :integer
  end
end

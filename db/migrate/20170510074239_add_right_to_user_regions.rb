class AddRightToUserRegions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_regions, :right, :string
  end
end

class AddLeftToUserRegions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_regions, :left, :string
  end
end

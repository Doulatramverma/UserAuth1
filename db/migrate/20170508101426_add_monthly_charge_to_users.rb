class AddMonthlyChargeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :monthly_charge, :decimal
  end
end

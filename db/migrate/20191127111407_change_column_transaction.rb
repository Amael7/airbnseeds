class ChangeColumnTransaction < ActiveRecord::Migration[5.2]
  def change
    change_column :transactions, :total_price, :float
  end
end

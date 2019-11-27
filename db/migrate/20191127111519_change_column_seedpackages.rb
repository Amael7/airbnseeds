class ChangeColumnSeedpackages < ActiveRecord::Migration[5.2]
  def change
    change_column :seedpackages, :package_price, :float
  end
end

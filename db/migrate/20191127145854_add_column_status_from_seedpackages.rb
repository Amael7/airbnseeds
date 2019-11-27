class AddColumnStatusFromSeedpackages < ActiveRecord::Migration[5.2]
  def change
    add_column :seedpackages, :status, :string
  end
end

class CreateSeedpackages < ActiveRecord::Migration[5.2]
  def change
    create_table :seedpackages do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :photo
      t.integer :package_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

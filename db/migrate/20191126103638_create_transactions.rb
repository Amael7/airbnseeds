class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.integer :total_price
      t.string :transaction_status
      t.references :seedpackage, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

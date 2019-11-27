class RemoveColumnTransactionStatusFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :transaction_status
  end
end

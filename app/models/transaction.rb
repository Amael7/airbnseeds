class Transaction < ApplicationRecord
  belongs_to :seedpackage
  belongs_to :user

  validates :transaction_date, presence: true
  validates :total_price, presence: true
  validates :transaction_status, presence: true
  validates :user_id, uniqueness: { scope: :seedpackage }
end

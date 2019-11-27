class Seedpackage < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  validates :package_price, presence: true
end

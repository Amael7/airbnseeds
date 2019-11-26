class Seedpackage < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  validates :package_price, presence: true
end

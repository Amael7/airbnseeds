class Seedpackage < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  validates :package_price, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
    pg_search_scope :search_seeds,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end

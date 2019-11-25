class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  paginates_per 10

  belongs_to :user, inverse_of: :products

  validates :user_id, presence: true
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000, only_integer: true }
  validates :image, presence: true
end

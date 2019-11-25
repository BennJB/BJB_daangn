class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :products, inverse_of: :user
  has_many :items

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end

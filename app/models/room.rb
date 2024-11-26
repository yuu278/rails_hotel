class Room < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :address, presence: true
  has_one_attached :image
  has_many :reservations, dependent: :destroy

  def self.search(query)
    where("name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end

  def self.area_search(area)
    where("address LIKE ?", "%#{area}%")
  end

  def image_or_default
    image.attached? ? image : 'facility_image.png'
  end

  def convert_price_to_float
    self.price = price.to_f if price.is_a?(String)
  end
end
class User < ApplicationRecord
    has_many :reservations, dependent: :destroy
    has_many :rooms, dependent: :destroy
  
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  
    has_one_attached :icon
  end
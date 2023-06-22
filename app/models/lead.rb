class Lead < ApplicationRecord
  has_many :responses
  has_many :answers, through: :responses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
end

class Campaign < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :forms
  has_many :responses, through: :forms
  has_many :leads, through: :responses

  validates :name, presence: true, uniqueness: true
  validates :details, presence: true
end

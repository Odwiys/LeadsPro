class Form < ApplicationRecord
  belongs_to :campaign, dependent: :destroy

  has_many :responses
  has_many :questions
  has_many :options, through: :questions
  has_many :answers, through: :questions
  has_many :leads, through: :responses

  validates :title, presence: true
end

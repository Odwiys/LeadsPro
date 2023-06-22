class Question < ApplicationRecord
  belongs_to :form, dependent: :destroy

  has_one :answer
  has_many :options

  validates :title, presence: true
  validates :format, presence: true
end

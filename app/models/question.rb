class Question < ApplicationRecord
  # belongs_to :form, through: :form_questions
  has_one :answer
  has_many :options, dependent: :destroy

  validates :title, presence: true
  validates :format, presence: true
end

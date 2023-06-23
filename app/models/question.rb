class Question < ApplicationRecord
  has_many :form_questions
  has_many :forms, through: :form_questions

  has_one :answer
  has_many :options, dependent: :destroy

  validates :title, presence: true
  validates :format, presence: true
end

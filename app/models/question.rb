class Question < ApplicationRecord
  has_many :form_questions
  has_many :forms, through: :form_questions

  has_many :answers, dependent: :destroy
  has_many :options, dependent: :destroy

  validates :title, presence: true
  validates :format, presence: true

  accepts_nested_attributes_for :options

  def is_mcq?
    format == "multiple choice"
  end
end

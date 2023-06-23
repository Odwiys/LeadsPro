class Form < ApplicationRecord
  belongs_to :campaign, dependent: :destroy

  has_many :responses
  has_many :form_questions
  has_many :questions, through: :form_questions
  has_many :options, through: :questions
  has_many :answers, through: :questions
  has_many :leads, through: :responses

  validates :title, presence: true

  def build_default_options
    Question.defaults
  end
end

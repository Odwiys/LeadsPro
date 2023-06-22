class Option < ApplicationRecord
  belongs_to :question, dependent: :destroy

  validates :value, presence: true
  validates :sentiment_value, presence: true
end

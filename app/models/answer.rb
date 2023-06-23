class Answer < ApplicationRecord
  belongs_to :response
  belongs_to :question

  validates :value, presence: true

  def sentiment
    # return float
  end
end

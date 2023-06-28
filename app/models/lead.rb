class Lead < ApplicationRecord
  has_one :response
  has_many :answers, through: :responses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true

  # after_create :analyse_sentiment

  # def analyse_sentiment
  #   # response.answers
  #   # - answer.sentiment
  #   # self.rating = 2
  #   # save!

  #   # rating = 0.0
  #   # response.answers.each do |answer|
  #   #   rating += answer.sentiment
  #   # end
  #   # # calculate the average / total rating
  #   # rating
  #   # # return <Float

  #   # if multiple choice, hard code sentiment points
  #   # else, run chatgpt analysis
  # end
end

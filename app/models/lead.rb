class Lead < ApplicationRecord
  has_one :response
  has_many :answers, through: :responses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true

  # after_create :analyse_sentiment

  # def analyse_sentiment(response)
  #   answers = response.answers
  #   rating = 0.0
  #   answers.each do |answer|
  #     # if multiple choice, take hard coded sentiment points
  #     if answer.question.format == "multiple choice"
  #       answer.question.options.each do |option|
  #         if option.value == answer.value
  #           sentiment = option.sentiment_value
  #           rating += sentiment
  #         end
  #       end
  #     else
  #       # else, take value from chatgpt analysis
  #       value = answer.sentiment_value
  #       rating += value
  #     end
  #   end
  #   # # calculate the average / total rating
  #   final_rating = rating / anwers.length

  #   # attribute rating to leads > rating
  #   this.rating = final_rating

  #   # self.rating = 2
  #   # save!
  # end
end

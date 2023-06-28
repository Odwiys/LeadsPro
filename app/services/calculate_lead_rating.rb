class CalculateLeadRating < ApplicationService
  def initialize
    @lead = lead
  end

  def analyse_sentiment
    answers = @lead.response.answers
    rating = 0.0
    answers.each do |answer|
      # if multiple choice, take hard coded sentiment points
      if answer.question.format == "multiple choice"
        answer.question.options.each do |option|
          if option.value == answer.value
            sentiment = option.sentiment_value
            rating += sentiment
          end
        end
      else
        # else, take value from chatgpt analysis
        value = answer.sentiment_value
        rating += value
      end
    end
    # # calculate the average / total rating
    final_rating = rating / anwers.length

    # attribute rating to leads > rating
    @lead.rating = final_rating

    # self.rating = 2
    # save!
  end
end

# CalculateLeadRating.(lead)

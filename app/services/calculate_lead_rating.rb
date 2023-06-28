class CalculateLeadRating < ApplicationService
  def initialize(lead)
    @lead = lead
  end

  def call
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
        value = answer.sentiment_value.to_f
        rating += value
      end
    end
    # # calculate the average / total rating
    final_rating = rating / answers.length

    # attribute rating to leads > rating
    @lead.rating = final_rating
    @lead.save
    # I NEED TO UPDATE THE LEAD HERE OR SOMEWHERE
    # self.rating = 2
    # save!
  end
end

# CalculateLeadRating.(lead)

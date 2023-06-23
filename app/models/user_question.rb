class UserQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def self.compulsory_questions_for(user)
    where(user:, compulsory: true)
      .map(&:question)
  end
end

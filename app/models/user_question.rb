class UserQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def self.compulsory_questions_for(user)
    where(user:, compulsory: true)
      .map(&:question)
  end


  def self.non_compulsory_questions_for(user)
    where(user:, compulsory: false)
  end

  def self.join_questions_for(user)
    where(user:, compulsory: true || false)
      .map(&:question)
  end
end

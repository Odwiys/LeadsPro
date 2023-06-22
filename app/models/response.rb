class Response < ApplicationRecord
  belongs_to :form
  belongs_to :lead

  has_many :answers
end

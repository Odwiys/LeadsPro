class FormQuestion < ApplicationRecord
  belongs_to :form
  belongs_to :question
end

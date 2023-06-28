class AddSentimentToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :sentiment_value, :float
  end
end

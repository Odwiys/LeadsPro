class AddSentimentValueToOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :options, :sentiment_value, :float
  end
end

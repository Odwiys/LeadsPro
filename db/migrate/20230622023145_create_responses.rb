class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :form, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true

      t.timestamps
    end
  end
end

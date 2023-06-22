class CreateUserQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_questions do |t|
      t.boolean :compulsory, default: false
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end

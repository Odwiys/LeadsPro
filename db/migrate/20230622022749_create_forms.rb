class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :title
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end

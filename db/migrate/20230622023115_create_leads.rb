class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.float :rating

      t.timestamps
    end
  end
end

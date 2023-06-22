class AddNamePhoneNumberAndCeaNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :cea_number, :string
  end
end
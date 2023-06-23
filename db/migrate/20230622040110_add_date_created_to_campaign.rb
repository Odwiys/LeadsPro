class AddDateCreatedToCampaign < ActiveRecord::Migration[7.0]
  def change
    add_column :campaigns, :date_created, :date
  end
end

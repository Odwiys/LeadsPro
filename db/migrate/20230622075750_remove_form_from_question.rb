class RemoveFormFromQuestion < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :form_id
  end
end

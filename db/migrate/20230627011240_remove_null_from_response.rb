class RemoveNullFromResponse < ActiveRecord::Migration[7.0]
  def change
    change_column_null :responses, :form_id, true
  end
end

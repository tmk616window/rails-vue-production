class AddColumnTaskcomment < ActiveRecord::Migration[6.1]
  def change
    add_column :taskcomments, :present_form, :boolean, default: false, null: false
  end
end

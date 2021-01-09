class AddUserColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :job, :string
    add_column :users, :usercomment, :text
  end
end

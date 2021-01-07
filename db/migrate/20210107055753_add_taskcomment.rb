class AddTaskcomment < ActiveRecord::Migration[6.1]
  def change
    add_reference :taskcomments, :task, foreign_key: true
  end
end

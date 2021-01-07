class CreateTaskcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :taskcomments do |t|
      t.string :title
      t.text :comment
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end

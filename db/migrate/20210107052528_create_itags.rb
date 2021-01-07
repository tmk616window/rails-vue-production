class CreateItags < ActiveRecord::Migration[6.1]
  def change
    create_table :itags do |t|
      t.string :tag
      t.references :task, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

class AddColumnTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :front_point, :integer
    add_column :tasks, :backend_point, :integer
    add_column :tasks, :plan_point, :integer
    add_column :tasks, :infra_point, :integer
    add_column :tasks, :unique_point, :integer
    add_column :tasks, :user_point, :integer

  end
end

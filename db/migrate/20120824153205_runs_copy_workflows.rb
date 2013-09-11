class RunsCopyWorkflows < ActiveRecord::Migration
  def change
    add_column :triggers,      :run_id, :integer
    add_column :steps,         :run_id, :integer
    add_column :notifications, :run_id, :integer
  end
end

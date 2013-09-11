class AddTimestampsToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :started_at,  :timestamp
    add_column :steps, :finished_at, :timestamp
  end
end

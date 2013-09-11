class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string    :state
      t.timestamp :started_at
      t.timestamp :finished_at

      t.references :workflow

      t.timestamps
    end
  end
end

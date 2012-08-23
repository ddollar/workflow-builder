class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.string :name
      t.string :trigger
      t.text   :trigger_args

      t.references :user

      t.timestamps
    end
  end
end

class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :num
      t.string  :type
      t.text    :args_raw

      t.references :workflow

      t.timestamps
    end
  end
end

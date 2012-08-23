class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.integer :num
      t.string  :type
      t.text    :args_raw

      t.references :workflow

      t.timestamps
    end
  end
end

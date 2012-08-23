class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :num
      t.string  :type
      t.text    :args_raw

      t.references :workflow

      t.timestamps
    end
  end
end

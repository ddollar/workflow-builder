class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid

      t.timestamps
    end
  end
end

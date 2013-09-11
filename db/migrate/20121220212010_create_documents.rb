class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user
      t.string :name
      t.string :uuid

      t.timestamps
    end
  end
end

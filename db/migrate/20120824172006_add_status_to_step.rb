class AddStatusToStep < ActiveRecord::Migration
  def change
    add_column :steps, :status, :string
  end
end

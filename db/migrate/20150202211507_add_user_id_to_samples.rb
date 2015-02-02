class AddUserIdToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :user_id, :integer
    add_index :samples, :user_id
  end
end

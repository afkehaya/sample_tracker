class AddDeletedAtToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :deleted_at, :datetime
  	add_index :samples, :deleted_at
  end
end

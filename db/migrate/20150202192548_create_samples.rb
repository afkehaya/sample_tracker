class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :line
      t.string :season
      t.string :style
      t.string :color
      t.datetime :date_out
      t.string :to_who
      t.datetime :date_in
      t.string :location

      t.timestamps
    end
  end
end

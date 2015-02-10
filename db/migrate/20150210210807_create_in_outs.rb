class CreateInOuts < ActiveRecord::Migration
  def change
    create_table :in_outs do |t|
      t.string :status

      t.timestamps
    end
  end
end

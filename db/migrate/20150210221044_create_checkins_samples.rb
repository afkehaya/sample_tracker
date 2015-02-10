class CheckinsSamples < ActiveRecord::Migration
  def change
    create_table :checkins_samples do |t|
    	t.integer :checkin_id
    	t.integer :sample_id
    
    end
  end
end

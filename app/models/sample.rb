# == Schema Information
#
# Table name: samples
#
#  id         :integer          not null, primary key
#  line       :string(255)
#  season     :string(255)
#  style      :string(255)
#  color      :string(255)
#  date_out   :datetime
#  to_who     :string(255)
#  date_in    :datetime
#  location   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Sample < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :checkins
  
def self.import(file, user_id)
	
    user = User.find_by(id: user_id)
    if user
      CSV.foreach(file.path, headers: true) do |row|
        sample = user.samples.create! row.to_hash

      end
    end
  end
end

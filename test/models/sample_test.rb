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

require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

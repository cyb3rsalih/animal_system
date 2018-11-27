# == Schema Information
#
# Table name: calves
#
#  id                  :integer          not null, primary key
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  birthdate           :date
#  earring_no          :string
#  image_content_type  :string
#  image_file_name     :string
#  image_file_size     :integer
#  image_updated_at    :datetime
#  info                :string
#  animal_id           :integer
#
# Indexes
#
#  index_calves_on_animal_id  (animal_id)
#

require 'test_helper'

class CalfTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

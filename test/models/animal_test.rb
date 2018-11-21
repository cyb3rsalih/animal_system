# == Schema Information
#
# Table name: animals
#
#  id                        :integer          not null, primary key
#  animal_type               :
#  birthdate                 :date
#  earring_no                :integer
#  gender                    :string
#  image_content_type        :string
#  image_file_name           :string
#  image_file_size           :integer
#  image_updated_at          :datetime
#  mating_date               :date
#  mother_earring_no         :integer
#  mother_image_content_type :string
#  mother_image_file_name    :string
#  mother_image_file_size    :integer
#  mother_image_updated_at   :datetime
#  name                      :string
#  picture                   :string
#  picture_of_mother         :string
#  state                     :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  vaccinate_id              :integer
#
# Indexes
#
#  index_animals_on_vaccinate_id  (vaccinate_id)
#

require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: animal_scions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  animal_id  :integer
#  scion_id   :integer
#
# Indexes
#
#  index_animal_scions_on_animal_id  (animal_id)
#  index_animal_scions_on_scion_id   (scion_id)
#

class AnimalScion < ApplicationRecord
    belongs_to :animal
    belongs_to :scion
end

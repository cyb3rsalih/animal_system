# == Schema Information
#
# Table name: scions
#
#  id         :integer          not null, primary key
#  name       :string
#  scion_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Scion < ApplicationRecord
    has_many :animal_scions
    has_many :animals, through: :animal_scions

    validates :name, presence: true
    validates :scion_date, presence: true
end

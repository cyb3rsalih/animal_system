class Calf < ApplicationRecord
    belongs_to :animal

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

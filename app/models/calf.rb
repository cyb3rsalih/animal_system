class Calf < ApplicationRecord
    belongs_to :animal

    has_attached_file :image, styles: { medium: "300x300", small: "200x200" },
                    default_url: "/assets/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

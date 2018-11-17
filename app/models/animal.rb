class Animal < ApplicationRecord
    has_many :calves, dependent: :destroy

    validates :earring_no, presence: true
    enum animal_type: [:inek, :tosun, :dana, :yok]

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates_attachment_content_type :mother_image, content_type: /\Aimage\/.*\z/

    accepts_nested_attributes_for :calves, reject_if: proc { |attributes| attributes['image'].blank? }, allow_destroy: true

    def image_url
        if(image_file_name == nil)
            File.join(Rails.root, "/app/assets/images/small/missing.png")
        else
            url = "/public"+ "#{image.url(:small).split('?').first}"
            File.join(Rails.root, url)
        end
    end
end

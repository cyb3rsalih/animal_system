# == Schema Information
#
# Table name: animals
#
#  id                        :integer          not null, primary key
#  animal_type               :
#  birthdate                 :date
#  earring_no                :string
#  gender                    :string
#  image_content_type        :string
#  image_file_name           :string
#  image_file_size           :integer
#  image_updated_at          :datetime
#  mating_date               :date
#  mother_earring_no         :string
#  mother_image_content_type :string
#  mother_image_file_name    :string
#  mother_image_file_size    :integer
#  mother_image_updated_at   :datetime
#  name                      :string
#  picture                   :string
#  picture_of_mother         :string
#  race                      :string
#  state                     :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  vaccinate_id              :integer
#
# Indexes
#
#  index_animals_on_vaccinate_id  (vaccinate_id)
#

class Animal < ApplicationRecord
    has_many :calves, dependent: :destroy
    has_many :animal_scions
    has_many :scions, through: :animal_scions

    validates :earring_no, presence: true
    validates :earring_no, uniqueness: true
    enum animal_type: [:inek, :tosun, :dana, :yok]
    has_attached_file :image,
        storage: :s3,
        s3_credentials: {
            access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
            secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
            s3_region: ENV.fetch('AWS_REGION'),
            bucket: ENV.fetch('S3_BUCKET_NAME'),
            s3_host_name: "s3-#{ENV.fetch('AWS_REGION')}.amazonaws.com"
        },
        path: ":attachment/:id/:style/:filename",
        url: "https://s3.us-east-2.amazonaws.com",
        styles: {
            medium: ["250x250#"],
            small: ["200x200#"]
        },
        default_url: 'missing.png'

    has_attached_file :mother_image,
        storage: :s3,
            s3_credentials: {
                access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
                secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
                s3_region: ENV.fetch('AWS_REGION'),
                bucket: ENV.fetch('S3_BUCKET_NAME'),
                s3_host_name: "s3-#{ENV.fetch('AWS_REGION')}.amazonaws.com"
            },
            path: ":attachment/:id/:style/:filename",
            url: "https://s3.us-east-2.amazonaws.com",
            styles: {
                medium: ["250x250#"],
                small: ["200x200#"]
            },
            default_url: 'missing.png'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates_attachment_content_type :mother_image, content_type: /\Aimage\/.*\z/

    accepts_nested_attributes_for :calves, reject_if: proc { |attributes| attributes['image'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :calves, reject_if: proc { |attributes| attributes['info'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :calves, reject_if: proc { |attributes| attributes['birthdate'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :calves, reject_if: proc { |attributes| attributes['earring_no'].blank? }, allow_destroy: true

    def image_url
        if(image_file_name == nil)
            File.join(Rails.root, "/app/assets/images/small/missing.png")
        else
            url = "/public"+ "#{image.url(:small).split('?').first}"
            File.join(Rails.root, url)
        end
    end
end

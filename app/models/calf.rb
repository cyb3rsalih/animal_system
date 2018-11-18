class Calf < ApplicationRecord
    belongs_to :animal
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
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

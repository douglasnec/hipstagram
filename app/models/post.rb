class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, 
                    styles: { thumb: "300x300>" },
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: 'AKIAJ57EWJKMPW4556TA',
                      secret_access_key: Rails.application.secrets.s3_secret
                    },
                    bucket: 'hipstagram_development'
end

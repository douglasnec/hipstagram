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
  has_and_belongs_to_many :tags

  def tag_names
    tags.map { |tag| tag.name }.join(', ')
  end

  def tag_names=(tag_names)
    self.tags = tag_names.split(', ').map do |tag|
      Tag.find_or_create_by(:name => tag)
    end
  end
end

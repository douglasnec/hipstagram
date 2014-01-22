class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, 
                    styles: { thumb: "300x300>", medium: '500x500>' },
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
    self.tags = Tag.find_or_create_from_tag_names(tag_names)
  end

  def self.display_by_tags_or_all(tag_name)
    tag_name ? Tag.find_by(name: tag_name).posts : Post.all
  end
end

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  #callback
  before_validation :format_name

  def to_s
    '#' + name
  end

  def to_param
    name
  end

  def self.find_or_create_from_tag_names(tag_names)
    tag_names.split(/,\s?/).map do |tag|
      find_or_create_by(:name => tag)
    end
  end

  private

  def format_name
    self.name = name.downcase.gsub(/[^a-z]/, '')
  end 

end

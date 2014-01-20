class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def hi
    "hu"
  end
end

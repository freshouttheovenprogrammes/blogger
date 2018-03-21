class Article < ApplicationRecord

  validates_presence_of :title, :body
  has_many :comments
  has_many :tags
end

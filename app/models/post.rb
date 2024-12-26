class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true,
                   length: { minimum: 3, maximum: 300 }
  validates :url, presence: true,
                 format: { with: URI.regexp(%w[http https]), message: "must be a valid URL" }
  validates :user_id, presence: true
end

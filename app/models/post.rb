class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  has_many :activities

  enum status: {approve: 1, reject: 0}
end

class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  has_many :activities
  delegate :name, to: :user, prefix: :user

  enum status: {approved: 1, rejected: 0}
end

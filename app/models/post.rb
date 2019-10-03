class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :activities, as: :activity
  enum status: {approve: 1, unapprove: 0}
end

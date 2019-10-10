class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments
  has_many :activities
  enum status: {approved: 1, rejected: 0}
  validates :subject, presence: true
  validates :topic_id, presence: true
  validates :content, presence: true,
                      length: {maximum: Settings.post.content.minimum}
  delegate :name, to: :user, prefix: :user
end

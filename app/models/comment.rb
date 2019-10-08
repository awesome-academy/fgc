class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent_comment, class_name: Comment.name,
                            optional: true

  has_many :sub_comments, class_name: Comment.name,
                        foreign_key: :comment_id
  has_many :activities

  validates :content, presence: true
  scope :root_comments, ->{where comment_id: nil}
  scope :date_descending, ->{order created_at: :desc}
  delegate :name, to: :user, prefix: :user
end

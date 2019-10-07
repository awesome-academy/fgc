class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent_comment, class_name: Comment.name,
                            optional: true

  has_many :sub_comments, class_name: Comment.name,
                        foreign_key: :comment_id
  has_many :activities
end

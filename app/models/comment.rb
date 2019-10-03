class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :comment
  has_many :activities, as: :activity
end

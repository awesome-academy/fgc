class User < ApplicationRecord
  has_many :activities
  has_many :posts
  has_many :owner, class_name: Activity.name,
                    foreign_key: :onwer_id,
                    dependent: :destroy
  has_many :receiver, class_name: Activity.name,
                    foreign_key: :receiver_id,
                    dependent: :destroy

  enum role: {admin: 1, user: 0}
end

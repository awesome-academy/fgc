class User < ApplicationRecord
  has_many :activities, as: :activity
  enum role: {admin: 1, user: 0}
end

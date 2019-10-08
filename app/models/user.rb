class User < ApplicationRecord
  before_save{email.downcase!}

  has_many :activities
  has_many :posts
  has_many :comments
  has_many :owner, class_name: Activity.name,
                    foreign_key: :onwer_id,
                    dependent: :destroy
  has_many :receiver, class_name: Activity.name,
                    foreign_key: :receiver_id,
                    dependent: :destroy

  enum role: {admin: 1, user: 0}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: Settings.user_password.maximum},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :name, presence: true,
            length: {
              maximum: Settings.user_name.maximum,
              minimum: Settings.user_name.minimum
            }
  has_secure_password
end

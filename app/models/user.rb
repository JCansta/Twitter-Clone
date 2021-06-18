class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy

    has_many :follows, dependent: :destroy

    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    validates :username, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: {minimum: 3,  maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: {maximum: 105},
                    format: { with: VALID_EMAIL_REGEX}

    has_secure_password

    self.per_page = 5
end
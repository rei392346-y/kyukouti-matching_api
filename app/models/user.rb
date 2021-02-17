class User < ApplicationRecord
  validates :nonscreen_last_name, presence: true, length: {maximum: 20}
  validates :nonscreen_first_name, presence: true, length: {maximum: 20}
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                        format: { with: VALID_EMAIL_REGEX},
                        uniqueness: true

end

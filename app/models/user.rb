class User < ActiveRecord::Base
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end

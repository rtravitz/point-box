class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password

end

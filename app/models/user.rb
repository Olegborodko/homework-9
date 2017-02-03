class User < ApplicationRecord
  has_secure_password

	has_many :posts, dependent: :destroy

  validates :email, 
  					presence: {message: 'email require'},
  				  uniqueness: {message: 'this email already exists'}
end

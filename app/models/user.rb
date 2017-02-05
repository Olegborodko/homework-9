class User < ApplicationRecord
  has_secure_password  # validation presence true
	has_secure_token :rid

	has_many :posts, dependent: :destroy

  validates :email, 
  					presence: {message: 'require'},
  				  uniqueness: {message: 'already exists'}
end

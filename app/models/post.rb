class Post < ApplicationRecord
	belongs_to :user

  validates :title,
            presence: {message: 'title input require'},
            length: { in: 3..300,  message: 'max length 300 symbol, min 3'}
  validates :text,
            presence: {message: 'test require'},
            length: { in: 5..500,  message: 'max length 500 symbol, min 5'}
end

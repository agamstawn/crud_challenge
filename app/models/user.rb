class User < ApplicationRecord
	has_many :flats

	validates :name, presence: true, length: {minimum: 3}
	validates :email, uniqueness: true

end

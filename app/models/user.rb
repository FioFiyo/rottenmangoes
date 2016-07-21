class User < ApplicationRecord
	#virtual attribute added to model
	#so plain txt doesn't get saved in the db
	#only stores the digest version(random hashes)
	has_many :reviews
	has_secure_password

	validates :email , presence: true

	validates :first_name, presence: true

	validates :last_name, presence: true

	validates :password, length: {in: 6..20}, on: :create

	def full_name
		"#{first_name} #{last_name}"
	end
end

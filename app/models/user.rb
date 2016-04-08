class User < ActiveRecord::Base
	before_save :encrypt_password
	validates :username, presence: true, :uniqueness => true
	validates :email, :uniqueness => true
	validates :password, presence: true
	private
	def encrypt_password
		self.salt = SecureRandom.base64
		self.password = Digest::SHA2.hexdigest("#{self.salt + self.password}")
	end
end

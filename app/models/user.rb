class User < ActiveRecord::Base
	has_many :profiles, :primary_key => "unique_id", :foreign_key => "user_unique_id"
	before_save :encrypt_password, :generate_unique_id
	validates :username, presence: true, :uniqueness => true
	validates :password, presence: true
	validates :email, :uniqueness => true
	validates :unique_id, :uniqueness => true
	private
	def encrypt_password
		self.salt = SecureRandom.base64
		self.password = Digest::SHA2.hexdigest("#{self.salt + self.password}")
	end
	def generate_unique_id
		self.unique_id = "#{Date.today.strftime('%Y%m%d') + SecureRandom.base64(rand(14..20))}" 
	end
end

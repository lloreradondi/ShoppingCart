class Profile < ActiveRecord::Base 
	validates :user_unique_id, presence: true, :uniqueness => true
end

class Location < ActiveRecord::Base
	
	has_many :visits
	
	validates :name, presence: true
	validates :name, length: { maximum: 30 }
	validates :city, presence: true
	validates :lat, presence: true
	validates :long, presence: true
	

	def self.last_created(limit)
 		order(created_at: :desc).limit(limit)
	end
end

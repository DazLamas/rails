class Visit < ActiveRecord::Base

	belongs_to :location
	belongs_to :user

	validates :from_date, presence: true
	validates :to_date, presence: true
	validates_associated :location
	validate :from_date_is_before_to_date
 
 	def from_date_is_before_to_date
 		if from_date.to_i > to_date.to_i
		 errors.add(:from_date, "can't be after to date")
 		end
 	end

end

class User < ActiveRecord::Base

	has_many :visits

	validates :user_name, presence: true
	validates :user_name, length: { maximum: 30 }
	validates :email, presence: true

	def self.last_created(limit)
 		order(created_at: :desc).limit(limit)
	end

	def self.users_for_select

		all.map { |u| [u.user_name, u.id] }

	end

end

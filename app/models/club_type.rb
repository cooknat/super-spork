class ClubType < ApplicationRecord

	def self.find_by_name(name)
		ClubType.where(name: name)
	end

end

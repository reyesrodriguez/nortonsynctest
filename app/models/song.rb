class Song < ActiveRecord::Base
	def self.search(search)
	if search
		@songs = Song.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
		Song.find(:all)
	end
end
end
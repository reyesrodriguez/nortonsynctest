class Song < ActiveRecord::Base

	require 'csv'

	validates :title, presence: true

	paginates_per 50

def self.search(search)
  where("artist ILIKE ? OR title ILIKE ? OR writer ILIKE ? OR publisher ILIKE ? OR theme ILIKE ?","%#{search}%", "%#{search}%","%#{search}%", "%#{search}%","%#{search}%")

end

def import(file)
	CSV.foreach('norton_catalogue.csv', :headers => true) do |row|
		Songs.create!(row.to_hash)
	end
end

end
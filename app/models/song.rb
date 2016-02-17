class Song < ActiveRecord::Base

def self.search(search)
  where("artist ILIKE ? OR title ILIKE ? OR writer ILIKE ? OR publisher ILIKE ? OR theme ILIKE ?","%#{search}%", "%#{search}%","%#{search}%", "%#{search}%","%#{search}%")

end
end
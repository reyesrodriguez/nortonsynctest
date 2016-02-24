class Artist < ActiveRecord::Base


	has_attached_file :download,
					  :storage => :s3,
					  :bucket => "nortonmusic"
					 

	has_attached_file :image, styles: {
		small: "64x64",
		med: "250x250",
		large: "400x400"
	}
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
	

end

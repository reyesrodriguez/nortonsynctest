class Artist < ActiveRecord::Base


	has_attached_file :download,
					  :storage => :s3,
					  :bucket => ENV['S3_BUCKET_NAME']
					 

	has_attached_file :image, styles: {
		small: "64x64",
		med: "240x240",
		large: "390x390"
	}
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
	

end

class SongsController < ApplicationController
		before_action :authenticate
		

 		def index
 			@songs = Song.all
 			if params[:search]
 			@songs = Song.search(params[:search])
 		else 
 			@songs = Song.all
		end
	end
end

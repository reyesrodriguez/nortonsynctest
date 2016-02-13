class SongsController < ApplicationController
 def index
 	@songs = Song.all

 	@songs = Song.search(params[:search])
 end

end


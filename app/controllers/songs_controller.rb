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

 def show 
 	@song = Song.find_by_id params[:id]

 	if @song.blank?
 		redirect_to songs_path, :alert => 'song not found'
 	end
end

 def new
 	@song = Song.new
 end

 def create 
 	@song = Song.new(song_params)
 	if @song.save
 		redirect_to :action => 'show', :id => @song.id
 	else 
 		render :action => 'new'
 	end
 end

  def edit
    @song = Song.find params[:id]
  end

 def update
 	@song = Song.find(params[:id])
 	if @song.update(song_params)
 		redirect_to :action => 'show', :id => @song.id
 	end
 end

 def destroy
 	@song = Song.find params[:id]
 	@song.destroy
 	
 	flash.notice="Song '#{@song.title}' by '#{@song.artist}' was deleted"

 	redirect_to songs_path
 end

 private
 	def song_params
 		params.require(:song).permit(:title, :artist, :catalogue, :writer, :publisher, :theme)
 	end




end

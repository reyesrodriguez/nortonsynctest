class ArtistsController < ApplicationController
	before_action :authenticate, :except => [:index, :show]
	def index 
		@artist = Artist.all
		
	end

	def show
		@artist = Artist.find_by_id params[:id]

		if @artist.blank?
			redirect_to artists_path, :alert => 'artist not found'
		end
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			redirect_to :action => 'index', :id => @artist.id
		else
			render :action => 'new'
		end
	end

	def edit
		@artist = Artist.find params[:id]
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update(artist_params)
			redirect_to :action => 'show', :id => @artist.id
		end
	
	end


	def destroy
		@artist = Artist.find params[:id]
		@artist.destroy

		flash.notice = "song '#{@artist.name}' was deleted"

		redirect_to artists_path

	end

	private
	def artist_params
		params.require(:artist).permit(:name, :image, :biography, :song)
	end

	
end
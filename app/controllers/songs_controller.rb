class SongsController < ApplicationController

def index
  @songs =  Song.all
end

def show
  @song = Song.find(params[:id])
  if @song.artist_id != nil
    @artist = Artist.find(@song.artist_id)
  end
  if @song.genre_id != nil
    @genre = Genre.find(@song.genre_id)
  end
end

def new
  @song = Song.new
  @artists = Artist.all
  @genres = Genre.all
end

def edit
  @song = Song.find(params[:id])
  @artists = Artist.all
  @genres = Genre.all
end

def create
  @song = Song.create(post_params(:name, :artist_id, :genre_id))
  redirect_to @song
end

def update
  @song = Song.find(params[:id])
  @song.update(post_params(:name, :artist_id, :genre_id))
  redirect_to @song
end

private

def post_params(*args)
   params.require(:song).permit(*args)
end

end

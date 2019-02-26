class SongsController < ApplicationController
  before_action :get_song, only: [:show]

  def index
    @songs = Song.all
  end

  def show
    get_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    get_song
  end

  def update
    get_song
    @song.update(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    get_song
    @song.destroy
    redirect_to songs_path
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end

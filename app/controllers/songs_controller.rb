class SongsController < ApplicationController
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
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    get_song
  end

  def update
    get_song
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    get_song
    @song.destroy
    redirect_to :action => 'index'
  end

  private
    def get_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :release_year, :artist_name, :genre)
    end

end

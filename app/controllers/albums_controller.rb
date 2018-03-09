class AlbumsController < ApplicationController
  before_action :require_login
  
  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = 'Album successfully created'
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    band = @album.band if @album
    @album.destroy if @album
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :year, :live)
  end

end

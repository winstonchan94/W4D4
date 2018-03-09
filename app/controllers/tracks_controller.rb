class TracksController < ApplicationController
  before_action :require_login
  
  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:success] = 'Track successfully created'
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    album = @track.album if @track
    @track.destroy if @track
    redirect_to album_url(album)
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :lyrics, :bonus)
  end

end

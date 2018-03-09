class BandsController < ApplicationController
  before_action :require_login
  
  def index
    render :index
  end

  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = 'Band successfully created!'
      redirect_to bands_url
    else
      flash[:errors] = ['Cannot create band']
      @band_name = params[:band][:name]
      render :new
    end
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    @band.destroy if @band
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end

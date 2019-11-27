class SeedpackagesController < ApplicationController
  before_action :set_seedpackages, only: %i[show destroy]

  def index
    @seedpackages = Seedpackage.all
  end

  def show
  end

  def new
    @seedpackage = Seedpackage.new
  end

  def create
    @seedpackage = Seedpackage.new(seedpackage_params)
    @seedpackage.status = 'Disponible'
    @seedpackage.user = current_user
    if @seedpackage.save
      redirect_to seedpackage_path(@seedpackage)
    else
      render 'new'
    end
  end

  def destroy
    @seedpackage.destroy
    redirect_to seedpackages_path
  end

  private

  def set_seedpackages
    @seedpackage = Seedpackage.find(params[:id])
  end

  def seedpackage_params
    params.require(:seedpackage).permit(:name, :description, :location, :photo, :package_price)
  end
end

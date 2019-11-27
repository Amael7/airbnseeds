class SeedpackagesController < ApplicationController
  def index
    @seedpackages = Seedpackage.all
  end

  def show
    @seedpackage = Seedpackage.find(params[:id])
  end

  def new
    @seedpackage = Seedpackage.new
  end

  def create
    @seedpackage = Seedpackage.new(seedpackage_params)
    @seedpackage.user = current_user
    if @seedpackage.save
      redirect_to seedpackage_path(@seedpackage)
    else
      render 'new'
    end
  end

  private

  def seedpackage_params
    params.require(:seedpackage).permit(:name, :description, :location, :photo, :package_price)
  end
end

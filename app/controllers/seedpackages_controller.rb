class SeedpackagesController < ApplicationController
  before_action :set_seedpackages, only: %i[show destroy]

  def index
    @seedpackages = Seedpackage.all
  end

  def show
    # @seedpackage = Seedpackage.find(params[:id])
    @transaction = Transaction.new
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

  def destroy
    # @seedpackage = Seedpackage.find(params[:id])
    @seedpackage.destroy
    redirect_to seedpackages_path(@seedpackage)
  end

  private

  def set_seedpackages
    @seedpackage = Seedpackage.find(params[:id])
  end

  def seedpackage_params
    params.require(:seedpackage).permit(:name, :description, :location, :photo, :package_price)
  end
end

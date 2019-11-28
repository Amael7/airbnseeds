class SeedpackagesController < ApplicationController
  before_action :set_seedpackages, only: %i[show destroy]

  def index
    if params[:query].present?
      @seedpackages = Seedpackage.search_seeds(params[:query])
    else
      @seedpackages = Seedpackage.all
    end
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

  def edit
    set_seedpackages
  end

  def update
    @seedpackage = Seedpackage.find(params[:id])
    @seedpackage.update(seedpackage_params)
    redirect_to dashboard_path
  end

  def destroy
    @seedpackage.destroy
    redirect_to dashboard_path
  end

  private

  def set_seedpackages
    @seedpackage = Seedpackage.find(params[:id])
  end

  def seedpackage_params
    params.require(:seedpackage).permit(:name, :description, :location, :photo, :package_price)
  end
end

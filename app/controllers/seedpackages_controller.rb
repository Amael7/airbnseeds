class SeedpackagesController < ApplicationController

  def index
    @seedpackages = Seedpackage.all
  end

  def show
    @seedpackage = Seedpackage.find(params[:id])
    @transaction = Transaction.new
  end

end

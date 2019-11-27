# require 'pry-byebug'

class TransactionsController < ApplicationController
  before_action :set_params, only: :create

  def create
    @transaction = Transaction.new
    @transaction.user = current_user
    @transaction.seedpackage = @seedpackage
    @transaction.total_price = @seedpackage.package_price
    @transaction.transaction_date = Time.now
    @transaction.transaction_status = "wait"
    if @transaction.save
      redirect_to seedpackages_path # a remplacer par le lien du dashboard
    else
      render 'seedpackages/show'
    end
  end

  private

  def set_params
    @seedpackage = Seedpackage.find(params[:seedpackage_id])
  end

  def params_transactions
    params.require(:transactions).permit(:seedpackage_id)
  end
end

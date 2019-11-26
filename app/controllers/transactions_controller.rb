require 'pry-byebug'

class TransactionsController < ApplicationController
  # before_action :set_params, only: :create

  def create
    binding.pry
    @transaction = Transaction.new
    @transaction.user = current_user
    @transaction.seedpackage = @seedpackage
    @transaction.total_price = @seedpackage.package_price
    @transaction.transaction_date = Time.now
    @transaction.transaction_status = "wait"
    if @transaction.save
      redirect_to 'pages#home'
    else
      redirect_to seedpackage_path(@seedpackage)
    end
  end

  private

  # def set_params
  #   @seedpackage = Seedpackage.find(params[:seedpackage_id])
  # end

  def params_transactions
    params.require(:transactions).permit(:seedpackage_id)
  end
end

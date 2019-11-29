class TransactionsController < ApplicationController
  before_action :set_params, only: %i[create]

  def create
    @transaction = Transaction.new
    @transaction.user = current_user
    @transaction.seedpackage = @seedpackage
    @transaction.total_price = @seedpackage.package_price
    @transaction.transaction_date = Time.now
    if @transaction.save
      @seedpackage.update(status: 'Sold Out')
      redirect_to dashboard_path
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

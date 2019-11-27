class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user

    transactions = Transaction.all
    @transactions_select = transactions.select do |transaction|
      transaction.user == @user
    end
    seedpackages = Seedpackage.all
    @seedpackages_select = seedpackages.select do |seedpackage|
      seedpackage.user == @user
    end
  end
end

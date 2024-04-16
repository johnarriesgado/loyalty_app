class TransactionsController < ApplicationController
  before_action :find_currency, only: [:create]

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :customer_id)
  end

  def find_currency
    curr = transaction_params[:currency]
    if curr.present? && curr.is_a?(String)
      txn_currency = Currency.find_by(name: curr)
      params[:currency] = txn_currency if txn_currency
    end
  end
end

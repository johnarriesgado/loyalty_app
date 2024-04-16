class CustomersController < ApplicationController
  def show
    @customer = Customer.includes(:rewards).find(params[:id])
    render json: @customer.as_json(include: :customer_rewards)
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:full_name, :birthday)
  end
end
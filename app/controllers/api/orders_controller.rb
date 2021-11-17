class Api::OrdersController < ApplicationController

  def index
    orders = Order.all

    render json: orders
  end

  def create
    order = Order.new
    order.assign_attributes(order_params)
    if order.save
      respond_to do |format|
        format.html
        format.json { render json: order }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    begin
      order = Order.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: order }
      end

    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: exception}, status: :unprocessable_entity }
      end
    end
  end
  

  private

  def order_params
    params.require(:order).permit(:book_id, :client_id)
  end
end


class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @item = Item.find(@order.item_id)
  end

  def create
    order = Order.create(user_id: 1, amount: 23, item_id: params[:item_id])
    AdminEmailWorker.perform_async(order)
    redirect_to order
  end
end

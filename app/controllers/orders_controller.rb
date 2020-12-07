class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def new
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private

    def order_params
      binding.pry
      params.require(:user_order).permit(:prefecture_id, :city, :address, :building_name, :phone_number,).merge(user_id: current_user.id)
    end

end

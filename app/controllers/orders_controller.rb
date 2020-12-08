class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    else
    @user_order = UserOrder.new
    end
  end

  def new
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @user_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.value, 
        card: order_params[:token], 
        currency: 'jpy' 
      )
       @user_order.save
       redirect_to root_path
    else 
      render :index
    end
  end

  private

    def order_params
      params.permit(:prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :postal_code, :token).merge(user_id: current_user.id)
    end

end

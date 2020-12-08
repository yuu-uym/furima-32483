class OrdersController < ApplicationController
  before_action :authenticate_user!
  
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
      Payjp.api_key = "sk_test_5a00e361485289064dea44c6"
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

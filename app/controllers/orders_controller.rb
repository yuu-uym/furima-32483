class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:create, :index]

  def index
    if @item.user_id == current_user.id || @item.order.present?
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
    if @user_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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
    params.require(:user_order).permit(:prefecture_id, :city, :address, :building_name, :phone_number, :postal_code).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

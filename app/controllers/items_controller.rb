class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
    @prototype = Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :description,:category_id, :condition_id,  :delivery_fee_id, :prefecture_id, :day_to_delivery_id, :value, :image).merge(user_id: current_user.id)
    end
  end

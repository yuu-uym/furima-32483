class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all.order("created_at DESC")
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
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else 
      render :edit
    end
   end

   def destroy
    if @item.user_id == current_user.id
     @item.destroy
     redirect_to root_path
    else
     edirect_to action: :index
    end
   end

  private

    def item_params
      params.require(:item).permit(:name, :description,:category_id, :condition_id,  :delivery_fee_id, :prefecture_id, :day_to_delivery_id, :value, :image).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end
  end

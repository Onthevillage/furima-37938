class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params_id, only: [:show, :edit, :update, :destroy]
  before_action :only_to_item_user, only: [:edit, :update, :destroy]
  before_action :soldout_edit, only: :edit

  def index
    @items = Item.order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def find_params_id
    @item = Item.find(params[:id])
  end

  def only_to_item_user
    unless current_user.id == @item.user.id
      redirect_to items_path
    end
  end

  def soldout_edit
    unless @item.order.nil?
      redirect_to root_path
    end
  end
end

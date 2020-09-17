class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.create(item_params)
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :content, :image, :category_id, :condition_id, :price, :shipping_fee_id, :prefecture_id, :days_for_shipping_id)
  end
end

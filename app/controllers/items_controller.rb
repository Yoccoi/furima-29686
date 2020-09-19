class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.user_id)
    @category = Category.find_by(id: @item.category_id)
    @condition = Condition.find_by(id: @item.condition_id)
    @shipping_fee = ShippingFee.find_by(id: @item.shipping_fee_id)
    @prefecture = Prefecture.find_by(id: @item.prefecture_id)
    @days = DaysForShipping.find_by(id: @item.days_for_shipping_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :content, :image, :category_id, :condition_id, :price, :shipping_fee_id, :prefecture_id, :days_for_shipping_id).merge(user_id: current_user.id)
  end
end

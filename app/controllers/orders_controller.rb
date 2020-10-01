class OrdersController < ApplicationController
  before_action :set_order
  before_action :move_to_login
  before_action :move_to_top, only: [:index, :create]
  # before_action :set_user

  def index
    @order = OrderAddress.new
    redirect_to root_path if @item.order
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @user = current_user
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.preserve
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end

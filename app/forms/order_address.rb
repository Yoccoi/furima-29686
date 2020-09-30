class OrderAddress
  include ActiveModel::Model
  # ストロングパラメーターで受け取ったカラムを記載
  attr_accessor :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    # カードに関するバリデーション
    validates :token
    # 住所に関するバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含んで入力してください' }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { greater_than: 12, message: 'は11桁以内で入力してください'}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def preserve
    # 注文の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end

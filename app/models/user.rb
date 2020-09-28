class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  # def Zenkaku
  #   @zenkaku = { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください' }
  #   @zenkaku_kana = /\A[ァ-ヶー－]+\z/
  # end

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /@.+/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, uniqueness: { case_sensitive: false }, message: 'は半角英数字で入力してください' }
    validates :password_confirmation
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :first_name_kana, format: { with: @zenkaku_kana, message: 'は全角で入力してください' }
    validates :last_name_kana, format: { with: @zenkaku_kana, message: 'は全角で入力してください' }
    validates :birth_date
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  def Zenkaku
    @zenkaku = /\A[ぁ-んァ-ン一-龥]/
    @zenkaku_kana = /\A[ァ-ヶー－]+\z/
  end

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /@.+/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, uniqueness: { case_sensitive: false }, message: 'Include both letters and numbers.' }
    validates :password_confirmation
    validates :first_name, format: { with: @zenkaku, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: @zenkaku, message: 'is invalid. Input full-width characters.'}
    validates :first_name_kana, format: { with: @zenkaku_kana, message: 'is invalid. Input full-width katakana characters.'}
    validates :last_name_kana, format: { with: @zenkaku_kana, message: 'is invalid. Input full-width katakana characters.'}
    validates :birth_date
  end
end

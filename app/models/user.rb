class User < ApplicationRecord
  belongs_to :user_classification
  has_secure_password

    #ハイフンあり、7桁の整数
    VALID_ZIPCODE_REGEX = /\A\d{3}[-]\d{4}\z/
    #メールアドレス
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #電話番号 ハイフンあり、整数
    VALID_PHONE_REGEX = /\A[0-9-]+\z/

    validates :first_name, presence: true, length: { maximum: 10 }
    validates :last_name, presence: true, length: { maximum: 10 }
    validates :zipcode, presence: true, format: {with: VALID_ZIPCODE_REGEX }
    validates :prefecture, presence: true, length: { maximum: 5 }
    validates :municipality, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: { maximum: 10 }
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :phone_number, presence: true, length: { maximum: 15 }, format: { with: VALID_PHONE_REGEX }
    validates :password, presence: true, length: { minimum: 6, maximum: 15 }

    has_many :products
    belongs_to :user_classification
    has_secure_password
end

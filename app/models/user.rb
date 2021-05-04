class User < ApplicationRecord

    #ハイフンなし、7桁の整数
    VALID_ZIPCODE_REGEX = /\A\d{7}\z/
    #メールアドレス
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #電話番号 ハイフンなし、10桁 または 11桁の整数
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

    validates :first_name, presence: true, length: { maximum: 10 }
    validates :last_name, presence: true, length: { maximum: 10 }
    validates :zipcode, presence: true, format: {with: VALID_ZIPCODE_REGEX }
    validates :prefecture, presence: true, length: { maximum: 5 }
    validates :municipality, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: { maximum: 10 }
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
    validates :password, presence: true, length: { minimum: 6, maximum: 15 }

    belongs_to :user_classification
end

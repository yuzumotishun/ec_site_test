class User < ApplicationRecord
    validates :first_name, presence: true, length: { maximum: 10 }
    validates :last_name, presence: true, length: { maximum: 10 }
    validates :zipcode, presence: true, format: {with: /^\d{7}$/}
    validates :prefecture, presence: true, length: { maximum: 5 }
    validates :municipality, presence: true, length: { maximum: 10 }
    validates :address, presence: true, length: { maximum: 10 }
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
    validates :password, presence: true, length: { minimum: 6, maximum: 15 }

    belongs_to :user_classification
end

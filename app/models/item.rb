class Item < ApplicationRecord
    validates :image, presence: true
    validates :name, presence: true
    validates :info, presence: true
    validates :category_id, presence: true
    validates :sales_status_id, presence: true
    validates :shipping_fee_status_id, presence: true
    validates :prefecture_id, presence: true
    validates :scheduled_delivery_id, presence: true
    validates :price, presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
    validates :user, presence: true

    #has_one :order
    belongs_to :user
    has_one_attached :image
end

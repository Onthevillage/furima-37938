class Item < ApplicationRecord
    validates :image, presence: true
    validates :name, presence: true
    validates :info, presence: true
    validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :sales_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
    validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
    validates :user, presence: true
    
    #has_one :order
    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :sales_status
    belongs_to :shipping_fee_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery

end

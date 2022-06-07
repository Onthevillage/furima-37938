class OrderPayForm
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building :phone_number, :order_id

    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :postal_code, presence: true
    validates :prefecture_id, presence: true
    validates :city, presence: true
    validates :addresses, presence: true
    validates :phone_number, presence: true
    validates :order_id, presence: true

    def save
    end
    
end
class Order < ApplicationRecord
    has_one :pay_form
    belongs_to :user
    belongs_to :item
end

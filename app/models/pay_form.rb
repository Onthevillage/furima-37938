class PayForm < ApplicationRecord
    belongs_to :order
    belongs_to :prefecture
end

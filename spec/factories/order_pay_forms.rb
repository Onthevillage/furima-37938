FactoryBot.define do
  factory :order_pay_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { '07012345678' }
  end
end

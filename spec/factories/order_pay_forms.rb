FactoryBot.define do
  factory :order_pay_form do
    postal_code { '106-6108' }
    prefecture_id { 13 }
    city { '東京都' }
    addresses { '港区六本木6-10-1' }
    building {'六本木ヒルズ'}
    phone_number { '0364066000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

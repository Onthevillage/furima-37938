require 'rails_helper'

RSpec.describe OrderPayForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_pay_form = FactoryBot.build(:order_pay_form, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'バリデーションに引っ掛からなければ購入できる' do
        expect(@order_pay_form).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_pay_form.building = nil
        expect(@order_pay_form).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'userが紐付いていなければ購入できない' do
        @order_pay_form.user_id = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("User can't be blank")
      end      
      it 'itemが紐付いていなければ購入できない' do
        @order_pay_form.item_id = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Item can't be blank")
      end      
      it 'postal_codeが空では購入できない' do
        @order_pay_form.postal_code = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがなければ購入できない' do
        @order_pay_form.postal_code = '1234567'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが0では購入できない' do
        @order_pay_form.prefecture_id = 0
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_pay_form.city = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では購入できない' do
        @order_pay_form.addresses = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_pay_form.phone_number = ''
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンを含んでいると購入できない' do
        @order_pay_form.phone_number = '03-6406-6000'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @order_pay_form.phone_number = '110'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_pay_form.phone_number = '810364066000'
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it "tokenが空では購入できない" do
        @order_pay_form.token = nil
        @order_pay_form.valid?
        expect(@order_pay_form.errors.full_messages).to include("Token can't be blank")
      end      
    end
  end
end

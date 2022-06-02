require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'バリデーションに引っ掛からなければ登録できる' do
        @item..valid?
      end
    end
  end
end

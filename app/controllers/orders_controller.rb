class OrdersController < ApplicationController
    before_action :set_item, only: [:index, :create]


    def index
        @order_pay_form = OrderPayForm.new
    end

    def create
        @order_pay_form = OrderPayForm.new(order_pay_form_params)
        if @order_pay_form.valid?
          pay_item
          @order_pay_form.save
          redirect_to root_path
        else
          render :index
        end
    end

    private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def order_pay_form_params
      params.require(:order_pay_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = "sk_test_0eb580fc447d5c79da875bc1" 
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_pay_form_params[:token],
        currency: 'jpy' 
      )
    end
end

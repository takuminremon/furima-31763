class PurchaseController < ApplicationController
   before_action :authenticate_user!
   before_action :current_user_dealer
   before_action :soldout_item
   before_action :set_item

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)   
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :municipality, :house_number, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
    #tokenを受け取れるように修正   token: params[:~~~]
  end

  def current_user_dealer
    redirect_to root_path if current_user == Item.find(params[:item_id]).user
  end

  def soldout_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end

class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]      
  before_action :authenticate_user!, except: [:index, :show]
  before_action :mismatch_login, only: [:edit, :update, :destroy]


  def index
    @item = Item.all.order('created_at DESC')      
  end
   
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def edit
   if @item.purchase
    redirect_to root_path
   end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :items_status_id, :delivery_fee_id, :area_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def mismatch_login
    redirect_to root_path unless current_user == Item.find(params[:id]).user
  end
end

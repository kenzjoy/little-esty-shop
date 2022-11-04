class ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @merchant_items = @merchant.items
  end

  def show
    @item = Item.find(params[:id])
    @item_price = @item.unit_price
  end 

  def update
    item = Item.find(params[:id])
    if params[:button] == 'true' && item.status == 'enabled'
      # item.status = 'disabled'
      item.update!(status: 'disabled')
    elsif params[:button] == 'true' && item.status == 'disabled'
      # item.status = 'enabled'
      item.update!(status: 'enabled')
    end
    # item.save
    redirect_to "/merchants/#{item.merchant.id}/items"
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.new(item_params)
    @item.save
    redirect_to "/merchants/#{@merchant.id}/items"
  end

  private
  def item_params
    params.permit(:name, :description, :unit_price, :status)
  end

end
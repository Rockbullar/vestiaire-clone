class ItemsController < ApplicationController
  def index
    @items = Item.all
    if params['categories']
      categories = params[:categories]
      @items = Item.where("categories ILIKE ?", "%#{categories}%")
    elsif params[:query].present?
      condition = params[:query]
      sql_query = "name ILIKE :query OR brand ILIKE :query OR categories ILIKE :query"
      @items = Item.where(sql_query, query: "%#{condition}%")
    else
      @items = Item.all
    end
    @items = @items.where(is_sold: false)
  end

  def show
    @item = Item.find(params[:id])
  end

  def userlistings
    @items = Item.where(user: current_user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save
    redirect_to items_path
    # item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :brand, :categories, :image_url)
  end
end

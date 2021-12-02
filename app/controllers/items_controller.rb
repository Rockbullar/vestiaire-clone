class ItemsController < ApplicationController
  has_scope :by_price, using: %i[min_price max_price], type: :hash
  has_scope :by_keyword
  has_scope :by_categories
  has_scope :by_size, using: %i[size_array], type: :hash

  def index
    @items = apply_scopes(Item).all
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
    @item.image_url = "https://source.unsplash.com/600x400/?#{@item.brand}},#{@item.categories}}"
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
    params.require(:item).permit(:name, :description, :price, :brand, :categories)
  end
end

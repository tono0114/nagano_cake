class Admin::ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id,:name,:image_id,:introduction,:price,:is_active,:image)
  end

end

class FavoritesController < ApplicationController
  respond_to :json, :html

  def index
    respond_with @favorites = Favorite.all
  end

  def create
    item = Item.find(params[:item_id])
    render json: Favorite.create(item_id: params[:item_id], item_name: item.name)
  end

  def destroy
    render json: Favorite.find_by(item_id: params[:id]).destroy
  end
end

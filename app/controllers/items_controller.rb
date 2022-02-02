class ItemsController < ApplicationController


  def index
    user = User.find_by( id: params[:user_id] )
      if user
        items = user.items
      else
        # 
        items = Item.all
      end
    render json: items, include: :user, status: 404
  end

  def show
    item = Item.find_by(id: params[:id])
      if item
        return render json: item
      else 
        return render json: { error: "Not Found" }, status: :not_found 
      end
  end

  def create
    item = Item.create(item_params)
    render json: item, status: 201
  end

  private

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end

end
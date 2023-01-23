class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :describe, :category, :condition, :delivery_charge, :prefecture, :days_to_ship, :price).merge(user_id: current_user.id)
  end

end

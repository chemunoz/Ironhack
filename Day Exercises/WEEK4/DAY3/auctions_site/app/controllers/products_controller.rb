class ProductsController < ApplicationController
  def new
    @user=User.find_by(id: params[:user_id])
    @product=@user.products.new
  end

  def index
  end
end

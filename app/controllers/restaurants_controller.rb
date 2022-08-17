class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit ,:update ,:destroy]
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @restaurant.update(params_restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

   def params_restaurant
     params.require(:restaurant).permit(:name, :address, :phone_number, :category)
   end
end

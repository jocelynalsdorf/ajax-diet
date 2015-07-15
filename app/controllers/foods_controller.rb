class FoodsController < ApplicationController
  def index
    @users = User.all
    @foods = Food.all
  end


  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    end
  end


  private
  def exercise_params
    params.require(:food).permit(:type, :calories)
  end

end

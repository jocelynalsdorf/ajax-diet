class FoodsController < ApplicationController
  def index
    @users = User.all
    @foods = Food.all
  end


  def show
    @food = Food.find(params[:id])

  end

  def new
    @user = User.find(params[:user_id])
    @food = @user.foods.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)
    if @food.save

      respond_to do |format|
        format.html { redirect_to user_path(@food.user) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])

  end

  def update
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])
    if @food.update(food_params)

      respond_to do |format|
        format.html { redirect_to user_path(@food.user) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])
    @food.destroy
    respond_to do |format|
      format.html {  redirect_to user_path(@food.user) }
      format.js
    end

  end


  private
  def food_params
    params.require(:food).permit(:food_name, :calories)
  end

end

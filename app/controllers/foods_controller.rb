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
    @food = Food.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)
    if @food.save
      respond_to do |format|
        # flash[:notice] = "Food successfully added!"
        format.html { redirect_to user_path(@food.user) }
        format.js
      end
    else
      respond_to do |format|
        format.js { render 'fail' }
      end
    end
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


  private
  def food_params
    params.require(:food).permit(:food_name, :calories)
  end

end

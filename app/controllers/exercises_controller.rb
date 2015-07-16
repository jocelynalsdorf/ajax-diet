class ExercisesController < ApplicationController
  def index
    @users = User.all
    @exercises = Exercise.all
  end


  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new
  end

  def create
  @user = User.find(params[:user_id])
    @exercise = @user.exercises.new(exercise_params)
    if @exercise.save

      respond_to do |format|
        format.html { redirect_to user_path(@exercise.user) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
  end

  def update
    @user= User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
      if @exercise.update(exercise_params)
        respond_to do |format|
          format.html { redirect_to user_path(@exercise.user) }
          format.js
        end
      else
          render :edit
        end
      end


  def destroy
    @user = User.find(params[:user_id])
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    respond_to do |format|
      format.html {  redirect_to user_path(@food.user) }
      format.js
    end
  end


  private
  def exercise_params
    params.require(:exercise).permit(:description, :burned)
  end

end

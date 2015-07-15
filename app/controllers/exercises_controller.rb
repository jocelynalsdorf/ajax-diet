class ExercisesController < ApplicationController
  def index
    @users = User.all
    @exercises = Exercise.all
  end


  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    end
  end


  private
  def exercise_params
    params.require(:exercise).permit(:description, :burned)
  end

end

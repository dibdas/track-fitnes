class ExercisesController < ApplicationController
  before_action :authenticate_request
  def index
    @exercises = Exercise.all
    render json: Exercises
  end

  def show
    @exercise = Exercises.find(params[:id])
    render json: @exercise
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      redirect_to @exercise
    else
      render :new
    end
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to @exercise
    else
      render :edit
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    redirect_to root_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:title)
  end
end

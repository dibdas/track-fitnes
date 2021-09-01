class ExercisesController < ApplicationController
    before_action :authenticate_user, only: %i[show]
    def index
        @exercises = Exercise.all
    end
    
    def show
        @exercise = Exercises.find(params[:id])
    end
    
    def new
        @article = Exercise.new
    end
    
    def create
        @article = Exercise.new(exercise_params)
    
        if @article.save
          redirect_to @article
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
          params.require(:exercise).permit(:name, :unit)
        end
    end
end

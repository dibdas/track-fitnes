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
    
      private
        def article_params
          params.require(:erxercise).permit(:name, :unit)
        end
    end
end

class MeasurementsController < ApplicationController
   before_action :authenticate_request

  def index
    @measurements = Measurement.includes(:exercise, :user).where(user_id: current_user)
    render json: @measurements
  end

  def show
    @measurement = Measurement.find(params[:id])
    render json: @measurement
  end

  def new
    @measurement = Measurement.new
  end

  def create
    measurement_params.each do |key, value|
      next if key == 'createdAt'

      exercise = Exercise.find_or_initialize_by(title: key)
      Measurement.create(measure: value, user: current_user, exercise: exercise)
    end
    render json: @measurement_params
  end

  def update
    @measurements = Measurement.find(params[:id])

    if @exercise.update
      render json: @measurement
    else
      render :edit
    end
  end

  def destroy
    @measurements = Measurement.find(params[:id])
    @measurements.destroy
  end

  private

  def measurement_params
    params.require(:measurements).permit(:leftbicep, :rightbicep, :hip, :leftthigh, :rightthigh, :waist, :createdAt)
  end
end

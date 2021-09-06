class MeasurementsController < ApplicationController
  before_action :authenticate_user
  def index
    @measurements = Measurement.includes(:exercise,:user).where(user_id: current_user.id)
    render :json => @measurements
  end

  def show
    @measurement = Measurement.find(params[:id])
    render :json => @measurement
  end

  def new
    @measurement = Measurement.new
  end

  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.user =  current_user

    if @measurements.save
      render :json => @measurements
    else
      render :new
    end
  end

  def update
    @measurements = Measurement.find(params[:id])

    if @exercise.update()
      render :json => @measurement
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
    params.require(:measurement).permit(:exercise_id, :user_id,:measure)
  end
end

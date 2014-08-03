class ForecastsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @forecast = Forecast.new
  end

  def create
    forecast = Forecast.create params[:forecast].permit(:location)
    redirect_to forecast_path(forecast.id)
  end
end

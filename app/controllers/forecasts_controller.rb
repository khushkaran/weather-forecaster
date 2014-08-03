require 'hashie'

class ForecastsController < ApplicationController
  before_action :authenticate_user!
  def index
    @forecasts = current_user.forecasts.order('created_at DESC')
  end

  def show
    @forecast = Forecast.find(params[:id])
    @currently = @forecast.api_data.currently
    @dailies = @forecast.api_data.daily
    @hourly = @forecast.api_data.hourly
  end

  def new
    @forecast = Forecast.new
  end

  def create
    forecast = current_user.forecasts.create params[:forecast].permit(:location)
    redirect_to forecast_path(forecast.id)
  end

  def destroy
    forecast = Forecast.find params[:id]
    forecast.destroy

    flash[:notice] = 'Forecast successfully deleted.'
    redirect_to forecasts_path
  end
end

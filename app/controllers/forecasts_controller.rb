class ForecastsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @forecast = Forecast.new
  end
end

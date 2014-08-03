class Forecast < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode

  def get_api_data
    ForecastIO.api_key = Rails.application.secrets.forecast_io_api_key
    ForecastIO.forecast(self.latitude, self.longitude, params:{units: 'uk'})
  end
end

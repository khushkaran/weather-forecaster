class Forecast < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode
  serialize(:api_data, Hash)

  def api_data
    while self.latitude == nil or self.longitude == nil
      wait(1)
    end
    ForecastIO.api_key = Rails.application.secrets.forecast_io_api_key
    ForecastIO.forecast(self.latitude, self.longitude, params:{units: 'uk'})
  end
end

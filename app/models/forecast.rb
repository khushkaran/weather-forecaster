class Forecast < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode
  after_save :save_mash
  serialize :api_data, Hash

  def save_mash
    ForecastIO.api_key = Rails.application.secrets.forecast_io_api_key
    forecast_data = ForecastIO.forecast(self.latitude, self.longitude, params:{units: 'uk'})
    update_column :api_data, forecast_data
  end
end

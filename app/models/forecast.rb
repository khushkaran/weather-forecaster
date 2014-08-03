class Forecast < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode

  def get_api_data
    
  end
end

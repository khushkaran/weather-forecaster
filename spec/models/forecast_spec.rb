require 'rails_helper'

Geocoder.configure(:lookup => :test)
Geocoder::Lookup::Test.add_stub("DE24 3JG", [ { 'latitude' => 52.875771, 'longitude' => -1.505059 } ])

describe Forecast do
  before{
    @forecast = create :forecast
  }
  it "knows its lattitude and longitude" do
    expect(@forecast.latitude.round(6)).to eq 52.875771
    expect(@forecast.longitude.round(6)).to eq -1.505059
  end
end

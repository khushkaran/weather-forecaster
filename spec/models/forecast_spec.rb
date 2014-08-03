require 'rails_helper'

describe Forecast do
  it "knows its lattitude and longitude" do
    forecast = create :forecast
    expect(forecast.latitude.round(6)).to eq 52.875771
    expect(forecast.longitude.round(6)).to eq -1.505059
  end
end

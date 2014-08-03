require 'rails_helper'

describe "New Forecast" do
  it "has a input box for location" do
    visit 'forecasts/new'
    expect(page).to have_css "input.forecast_location"
  end
end
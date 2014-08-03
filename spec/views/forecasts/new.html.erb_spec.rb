require 'rails_helper'

describe "New Forecast" do
  before{
    visit 'forecasts/new'
  }

  it "has a input box for location" do
    expect(page).to have_css "input.forecast_location"
  end

  it "redirects to the show page on creation" do
    fill_in "forecast_location", with: "DE24 3JG"
    click_button 'Get Forecast'
    expect(page).to have_css "h1", text: "DE24 3JG"
  end
end
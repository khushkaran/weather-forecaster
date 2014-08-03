require 'rails_helper'

describe "Viewing a forecast" do
  before{
    @forecast = create :forecast   
    visit forecast_path(@forecast)
  }

  it "displays the title" do
    expect(page).to have_content "Forecast for DE24 3JG"
  end

  it "displays the current weather" do
    expect(page).to have_content "Current Conditions"
    expect(page).to have_content "Partly Cloudy"
    expect(page).to have_content "Feels Like 16"
  end
end
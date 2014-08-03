require 'rails_helper'

describe "Viewing a forecast" do
  before{
    @forcast = create: :forecast   
  }
  it "displays the title" do
    visit forecast_path(FIRSTFORECAST)
    expect(page).to have_content "Forecast for DE24 3JG"
  end
end
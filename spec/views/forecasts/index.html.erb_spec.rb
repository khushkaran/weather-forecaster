require 'rails_helper'

describe "Displaying index" do
  before{
    create :forecast
  }
  it "displays the created forecasts" do
    visit 'forecasts'
    expect(page).to have_content "Location"
    expect(page).to have_content "Latitude"
    expect(page).to have_content "Longitude"
    expect(page).to have_content "DE24 3JG"
    expect(page).to have_content "52.875771"
    expect(page).to have_content "-1.505059"
  end

  it "a forecast can be deleted" do
    visit 'forecasts'
    click_button 'Delete'
    expect(page).not_to have_content "DE24 3JG"
    expect(page).not_to have_content "52.875771"
    expect(page).not_to have_content "-1.505059"
  end
end
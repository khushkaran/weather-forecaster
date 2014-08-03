require 'rails_helper'

describe "New Forecast" do
  context "whilst not signed in" do
    it "displays an error and returns user to login page" do
      visit 'forecasts'
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
  context "whilst signed in" do
    before{
      login_as create :user
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
end
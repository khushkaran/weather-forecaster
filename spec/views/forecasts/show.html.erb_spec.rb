require 'rails_helper'

describe "Viewing a forecast" do
  context "whilst not signed in" do
    it "displays an error and returns user to login page" do
      visit 'forecasts'
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
  context "whilst signed in" do
    before{
      login_as create :user
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
end
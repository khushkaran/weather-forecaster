require 'rails_helper'

describe "Displaying index" do
  context "whilst not signed in" do
    it "displays an error and returns user to login page" do
      visit 'forecasts'
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
  context "whilst signed in" do
    before{
      login_as create :user
      create :forecast
      visit 'forecasts'
    }
    it "displays the created forecasts" do
      expect(page).to have_content "Location"
      expect(page).to have_content "Latitude"
      expect(page).to have_content "Longitude"
      expect(page).to have_content "DE24 3JG"
      expect(page).to have_content "52.875771"
      expect(page).to have_content "-1.505059"
    end

    it "a forecast can be deleted" do
      click_link 'Delete'
      expect(page).not_to have_content "DE24 3JG"
      expect(page).not_to have_content "52.875771"
      expect(page).not_to have_content "-1.505059"
    end

    it "a forecast can be viewed" do
      click_link 'View'
      expect(page).to have_content "Forecast for DE24 3JG"
      expect(page).to have_content "52.875771"
      expect(page).to have_content "-1.505059"
    end

    it "has a link for creating a new forecast" do
      expect(page).to have_content "Create Forecast"
    end

    it "can only see their own forecasts" do
      logout
      login_as create :user2
      visit 'forecasts'
      expect(page).to have_content "Location"
      expect(page).to have_content "Latitude"
      expect(page).to have_content "Longitude"
      expect(page).not_to have_content "DE24 3JG"
      expect(page).not_to have_content "52.875771"
      expect(page).not_to have_content "-1.505059"
    end
  end
end
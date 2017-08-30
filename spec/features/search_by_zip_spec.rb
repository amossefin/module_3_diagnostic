require 'rails_helper'

describe "When user visits root page" do
  it "should be able to search by zipcode" do
    VCR.use_cassette("features/search_by_zipcode") do
      visit '/'

      fill_in("q", with: '80203')
      click_on('Locate')

      expect(current_path).to eq("/search")
      expect(page).to have_selector("station", count: 10)

    end
  end
end

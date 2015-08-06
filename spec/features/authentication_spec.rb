require 'rails_helper'

feature "the signup process" do

  scenario "can navigate to root url" do
    visit root_url
    expect(page).to have_content "coding pair whose"
  end

  # scenario "can navigate through continue button" do
  #   visit root_url
  #   click_button("Continue")
  #   expect(page).to have_content "Sign Up!"
  # end

  feature "signing in/up user" do
    before(:each) do
      visit root_url
    end

    scenario "can see user modal" do
      find("#continue-button").click
      expect(page).to have_content "Username"
    end

    scenario "can navigate to sign in screen" do
      click_on "Sign In"
      expect(page).to have_content "Github"
    end

  end

end

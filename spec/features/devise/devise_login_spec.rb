require "rails_helper"

# Testing Devise because huge part of its natural behaviour was changed in this project
RSpec.feature "DeviseLogins", type: :feature do
  before do
    create(:user, email: "testing@example.com", password: "password")
  end

  scenario "User logs in" do
    visit unauthenticated_root_path

    fill_in :user_email, with: "testing@example.com"
    fill_in :user_password, with: "password"

    click_on "Log in"

    expect(page).to have_text "Signed in successfully."
  end

  scenario "User changes language and then logs in" do
    visit unauthenticated_root_path

    click_on "PL"

    fill_in :user_email, with: "testing@example.com"
    fill_in :user_password, with: "password"

    click_on "Zaloguj się"

    expect(page).to have_text "Zalogowano pomyślnie."
  end
end

require "rails_helper"

# Testing Devise because huge part of its natural behaviour was changed in this project
RSpec.feature "DeviseHotwireErrors", type: :feature do
  scenario "User tries to login with improper data" do
    visit unauthenticated_root_path

    click_on "Log in"

    expect(page).to have_text "Invalid Email or password."
  end

  scenario "User tries to sign up with improper data" do
    visit unauthenticated_root_path

    click_on "Sign up"

    click_on "Sign up"

    expect(page).to have_text "Please review the problems below:"
  end

  scenario "User tries to resend confirmation instructions with improper data" do
    visit unauthenticated_root_path

    click_on "Forgot your password?"

    click_on "Send me reset password instructions"

    expect(page).to have_text "Please review the problems below:"
  end

  scenario "User tries to resend confirmation instructions with improper data" do
    visit unauthenticated_root_path

    click_on "Didn't receive confirmation instructions?"

    click_on "Resend confirmation instructions"

    expect(page).to have_text "Please review the problems below:"
  end

  scenario "User tries to resend confirmation instructions with improper data" do
    visit unauthenticated_root_path

    click_on "Didn't receive unlock instructions?"

    click_on "Resend unlock instructions"

    expect(page).to have_text "Please review the problems below:"
  end
end

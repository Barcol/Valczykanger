require "rails_helper"

RSpec.feature "CreateMelange", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  scenario "User creates new melange" do
    visit new_melange_path

    fill_in :melange_name, with: "Wydarzenie Testowe"
    fill_in :melange_event_date, with: "2021-05-21 12:00"

    click_on "Utwórz"

    expect(page).to have_text "Wydarzenie utworzone poprawnie"
    expect(page).to have_text "Podstawowe dane"
    expect(page).to have_text "Wydarzenie Testowe"
    expect(page).to have_text "21 maj 12:00"
  end
end

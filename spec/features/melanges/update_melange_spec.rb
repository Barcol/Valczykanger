require "rails_helper"

RSpec.feature "UpdateMelange", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  scenario "User destroys his only melange" do
    create(:melange, :with_organizer, organizer: User.first)

    visit melanges_path

    click_on "Akcje"
    click_on "Edytuj"

    fill_in :melange_name, with: "Wydarzenie Testowe"
    fill_in :melange_event_date, with: "2021-05-21 12:00"

    click_on "Zapisz"

    expect(page).to have_text "Wydarzenie zaktualizowane poprawnie."
    expect(page).to have_text "Wydarzenie Testowe"
    expect(page).to have_text "21 maj 12:00"
  end
end

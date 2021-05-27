require "rails_helper"

RSpec.feature "UpdateMelange", type: :feature do
  let(:user) { create(:user, language: "en") }

  before do
    login_as user, scope: :user
  end

  scenario "The I18n 'count' works properly with only 'one' and 'other' keys" do
    create(:melange, :with_organizer, organizer: User.first)
    visit melanges_path
    expect(page).to have_text "1 Event that you participate in."

    create(:melange, :with_organizer, organizer: User.first)
    visit melanges_path
    expect(page).to have_text "2 Events that you participate in."

    create(:melange, :with_organizer, organizer: User.first)
    visit melanges_path
    expect(page).to have_text "3 Events that you participate in."

    create(:melange, :with_organizer, organizer: User.first)
    visit melanges_path
    expect(page).to have_text "4 Events that you participate in."
  end
end

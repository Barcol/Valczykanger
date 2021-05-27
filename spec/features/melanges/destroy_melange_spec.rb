require "rails_helper"

RSpec.feature "DestroyMelange", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  scenario "User destroys his only melange" do
    create(:melange, :with_organizer, organizer: User.first)

    visit melanges_path

    click_on "Akcje"
    click_on "Usuń"

    expect(page).to have_text "Wydarzenie zostało permanentnie usunięte"
    expect(page).to have_text "0 Wydarzeń w których bierzesz udział."
  end
end

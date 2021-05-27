require "rails_helper"

RSpec.feature "Melange accessibility based on Participants", type: :feature do
  scenario "User does not see unowned melange on his index page" do
    user = create(:user)
    login_as user, scope: :user

    create(:melange, name: "Niewidoczne wydarzenie")

    visit melanges_path

    expect(page).not_to have_text "Niewidoczne wydarzenie"
  end

  scenario "User cannot visit show page of unowned melange" do
    user = create(:user)
    login_as user, scope: :user

    melange = create(:melange)

    visit melange_path(melange)

    expect(page).to have_text "Nie masz wystarczających uprawnień do podjęcia tej akcji."
  end

  scenario "User cannot edit or delete melange that he participates as guest" do
    user = create(:user)
    login_as user, scope: :user

    create(:participant, user: user, melange: create(:melange, name: "Urodziny"), role: :guest)

    visit melanges_path

    expect(page).to have_text "Urodziny"
    expect(page).not_to have_text "Edytuj"
    expect(page).not_to have_text "Usuń"
  end

  scenario "User can edit and delete melange, that he participates as organizer" do
    user = create(:user)
    login_as user, scope: :user

    melange = create(:melange, :with_organizer, organizer: user, name: "Imieniny")

    visit melanges_path

    expect(page).to have_text "Imieniny"
    expect(page).to have_text "Edytuj"
    expect(page).to have_text "Usuń"

    visit edit_melange_path(melange)

    expect(page).to have_css 'input[value="Zapisz"]'
  end
end

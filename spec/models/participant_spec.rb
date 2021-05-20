require "rails_helper"

RSpec.describe Participant, type: :model do
  describe "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:melange) }

    context "when melange that participants belongs to, is being destroyed" do
      it "deletes them with it " do
        melange = create(:melange, :with_participants, number: 5)

        expect(Participant.count).to eq 5
        melange.destroy!
        expect(Participant.count).to eq 0
      end
    end

    context "when participant is created without role" do
      it "by default gets a role of guest" do
        participant = Participant.create!(melange: create(:melange), user: create(:user))

        expect(participant.role).to eq "guest"
      end
    end
  end
end

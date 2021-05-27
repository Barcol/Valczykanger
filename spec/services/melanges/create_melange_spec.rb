require "rails_helper"

RSpec.describe Melanges::CreateMelange, type: :model do
  describe ".call" do
    context "when called with proper data" do
      it "returns true" do
        melange = create(:melange)
        user = create(:user)

        expect(Melanges::CreateMelange.call(melange, user)).to be_truthy
      end

      it "saves given melange" do
        melange = build(:melange)

        expect(melange.persisted?).to be_falsy

        Melanges::CreateMelange.call(melange, create(:user))

        expect(melange.persisted?).to be_truthy
      end

      it "creates Participant with role of organizer" do
        melange = create(:melange)
        user = create(:user)

        expect(Participant.count).to eq 0

        Melanges::CreateMelange.call(melange, user)

        expect(Participant.count).to eq 1
        expect(Participant.first.melange).to eq melange
        expect(Participant.first.user).to eq user
        expect(Participant.first.organizer?).to be_truthy
      end
    end

    context "when called with improper data" do
      it "returns false" do
        melange = build(:melange, name: "")
        user = create(:user)

        expect(Melanges::CreateMelange.call(melange, user)).to be_falsy
      end

      it "does not saves melange" do
        melange = build(:melange, name: "")

        Melanges::CreateMelange.call(melange, create(:user))

        expect(melange.persisted?).to be_falsy
      end

      it "does not create any Participants" do
        melange = build(:melange, name: "")

        Melanges::CreateMelange.call(melange, create(:user))

        expect(Participant.count).to eq 0
      end
    end
  end
end

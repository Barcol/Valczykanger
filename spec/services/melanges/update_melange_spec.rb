require "rails_helper"

RSpec.describe Melanges::UpdateMelange, type: :model do
  describe ".call" do
    context "when called with proper data" do
      it "returns true and updates attributes" do
        melange = create(:melange, name: "Pierwsza Nazwa", event_date: Date.parse("20-08-1995"))

        new_params = { name: "Po poprawkach", event_date: Date.parse("15-02-2007") }

        expect(Melanges::UpdateMelange.call(melange, new_params)).to be_truthy
        expect(melange.name).to eq "Po poprawkach"
        expect(melange.event_date).to eq Date.parse("15-02-2007")
      end
    end
  end
end

require "rails_helper"

RSpec.describe Participant, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:melange) }
    it { is_expected.to validate_presence_of(:role) }

    # context "when melange that participants belongs to is being destroyed" do
    #   it "deletes them with it " do
    #     create(:melagne)
    #     expect(conference.state).to eq "created"
    #   end
    # end
  end
end

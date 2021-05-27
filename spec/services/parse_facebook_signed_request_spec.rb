require "rails_helper"

RSpec.describe ParseFacebookSignedRequest, type: :model do
  describe ".call" do
    context "when called with improper secret" do
      it "raises WrongToken exception" do
        encoded_sig = Base64.urlsafe_encode64("totally")
        payload = Base64.urlsafe_encode64("{\"normal\": \"token\"}")
        signed_request = "#{encoded_sig}.#{payload}"
        secret = Base64.urlsafe_encode64("123ImTotallySecretLikeASpy")

        expect {
          ParseFacebookSignedRequest.call(signed_request, secret)
        }.to raise_exception ParseFacebookSignedRequest::WrongToken
      end
    end
  end
end

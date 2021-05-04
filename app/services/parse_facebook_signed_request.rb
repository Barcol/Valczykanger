class ParseFacebookSignedRequest < ApplicationService
  class WrongToken < StandardError
  end

  def call
    parse_fb_signed_request
  end

  private

  def initialize(signed_request, app_secret)
    @signed_request = signed_request
    @secret = app_secret
  end

  def parse_fb_signed_request
    encoded_sig, payload = @signed_request.split(".", 2)

    decoded_sig = Base64.urlsafe_decode64(encoded_sig)
    data = JSON.load(Base64.urlsafe_decode64(payload))

    expected_sig = OpenSSL::HMAC.digest("SHA256", @secret, payload)

    if decoded_sig != expected_sig
      raise WrongToken
    end

    data
  end
end
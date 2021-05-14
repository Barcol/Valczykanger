module Responses
  class Failure
    attr_reader :response_object

    def initialize(response_object)
      @response_object = response_object
    end

    def success?
      false
    end
  end
end

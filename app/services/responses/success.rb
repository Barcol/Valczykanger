module Responses
  class Success
    attr_reader :response_object

    def initialize(response_object)
      @response_object = response_object
    end

    def success?
      true
    end
  end
end


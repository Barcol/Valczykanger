module Melanges
  class UpdateMelange < ApplicationService
    def call
      @melange.assign_attributes(@melange_params)
      return false unless @melange.valid?

      @melange.save!
    end

    private

    def initialize(melange, melange_params)
      @melange = melange
      @melange_params = melange_params
    end
  end
end

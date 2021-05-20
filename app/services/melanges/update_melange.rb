module Melanges
  class UpdateMelange < ApplicationService
    def call
      update_melange
    end

    private

    def initialize(melange, melange_params)
      @melange = melange
      @melange_params = melange_params
    end

    def update_melange
      Melange.transaction do
        @melange.assign_attributes(@melange_params)
        if @melange.valid?
          @melange.save!
          true
        else
          false
        end
      end
    end
  end
end

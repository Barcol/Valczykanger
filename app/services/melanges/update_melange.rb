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
          Responses::Success.new(@melange)
        else
          Responses::Failure.new(@melange)
        end
      end
    end
  end
end

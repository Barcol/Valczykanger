module Melanges
  class CreateMelange < ApplicationService
    def call
      create_melange
    end

    private

    def initialize(melange, user)
      @melange = melange
      @user = user
    end

    def create_melange
      Melange.transaction do
        if @melange.valid?
          @melange.save!
          Participant.create!(melange: @melange, user: @user, role: :organizer)
          true
        else
          false
        end
      end
    end
  end
end

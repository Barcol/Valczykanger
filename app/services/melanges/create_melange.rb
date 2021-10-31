module Melanges
  class CreateMelange < ApplicationService
    def call
      with_transaction { create_melange }
    end

    private

    def initialize(melange, user)
      @melange = melange
      @user = user
    end

    def create_melange
      return false unless @melange.valid?

      @melange.create_organizer(user: @user)
      @melange.save!
    end
  end
end

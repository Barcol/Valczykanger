class MelangesController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    CreateMelange.call(@melange)
  end

  def edit
  end

  def update

  end

  def destroy

  end

  def index
  end
end

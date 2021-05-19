class MelangesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    response = Melanges::CreateMelange.call(@melange, current_user)
    if response.success?
      redirect_to melange_path(response.response_object), notice: I18n.t("controllers.melanges.create.ok")
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    response = Melanges::UpdateMelange.call(@melange, melange_params)
    if response.success?
      redirect_to melange_path(response.response_object), notice: I18n.t("controllers.melanges.create.ok")
    else
      render :edit, status: 422
    end
  end

  def destroy
  end

  def index
  end

  private

  def melange_params
    params.require(:melange).permit(:name, :event_date)
  end
end

class MelangesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    if Melanges::CreateMelange.call(@melange, current_user)
      redirect_to melange_path(@melange), notice: I18n.t("controllers.melanges.create.ok")
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if Melanges::UpdateMelange.call(@melange, melange_params)
      redirect_to melange_path(@melange), notice: I18n.t("controllers.melanges.update.ok")
    else
      render :edit, status: 422
    end
  end

  def destroy
    @melange.destroy!
    redirect_to melanges_path, notice: I18n.t("controllers.melanges.destroy.ok")
  end

  def index
  end

  private

  def melange_params
    params.require(:melange).permit(:name, :event_date)
  end
end

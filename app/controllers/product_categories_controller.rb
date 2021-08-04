class ProductCategoriesController < ApplicationController
  load_and_authorize_resource :melange
  load_and_authorize_resource :product_category,
                              through: :melange,
                              singleton: true,
                              shallow: true

  def new; end

  def create
    if @product_category.valid?
      @product_category.save!
      redirect_to melange_path(@melange),
                  notice: I18n.t("controllers.melanges.create.ok")
    else
      render :new, status: 422
    end
  end

  def edit; end

  def update
    if @product_category.valid?
      @product_category.save!
      redirect_to melange_path(@melange),
                  notice: I18n.t("controllers.melanges.update.ok")
    else
      render :new, status: 422
    end
  end

  def destroy
    @product_category.destroy!
    redirect_to melanges_path, notice: I18n.t("controllers.melanges.destroy.ok")
  end

  def show; end

  private

  def product_category_params
    params.require(:product_category).permit(:name)
  end
end

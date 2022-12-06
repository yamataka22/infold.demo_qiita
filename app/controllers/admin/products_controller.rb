module Admin
  class ProductsController < BaseController
    before_action { @page_title = 'PRODUCTS' }

    def index
      @search = ProductSearchForm.new(search_params)
      @products = @search.perform(params[:page], limit: params[:limit], csv: request.format == :csv)
    end

    def show
      @product = Product.find(params[:id])
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new
      @product.assign_attributes(post_params)
      if @product.save
        flash.now[:notice] = t('infold.flash.created')
        render :form
      else
        flash.now[:alert] = t('infold.flash.invalid')
        render :form, status: :unprocessable_entity
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      @product.assign_attributes(post_params)
      if @product.save
        flash.now[:notice] = t('infold.flash.updated')
        render :form
      else
        flash.now[:alert] = t('infold.flash.invalid')
        render :form, status: :unprocessable_entity
      end
    end

    def destroy
      @product = Product.find(params[:id])
      if @product.destroy
        redirect_to admin_products_path, status: :see_other, flash: { notice: t('infold.flash.destroyed') }
      else
        flash.now[:alert] = t('flash.invalid_destroy')
        render :show, status: :unprocessable_entity
      end
    end

    private

    def search_params
      params[:search]&.permit(
        :id_eq,
        :sort_field,
        :sort_kind
      )
    end

    def post_params
      params.require(:admin_product).permit(
        :title,
        :photo,
        :remove_photo,
        :price
      )
    end
  end
end
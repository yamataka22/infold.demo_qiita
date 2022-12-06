module Admin
  class OrdersController < BaseController
    before_action { @page_title = 'ORDERS' }

    def index
      @search = OrderSearchForm.new(search_params)
      @orders = @search.perform(params[:page], limit: params[:limit], csv: request.format == :csv)
    end

    def show
      @order = Order.find(params[:id])
    end

    def new
      @order = Order.new
      @order.order_details.build
    end

    def create
      @order = Order.new
      @order.assign_attributes(post_params)
      if @order.save
        flash.now[:notice] = t('infold.flash.created')
        render :form
      else
        flash.now[:alert] = t('infold.flash.invalid')
        render :form, status: :unprocessable_entity
      end
    end

    def edit
      @order = Order.find(params[:id])
    end

    def update
      @order = Order.find(params[:id])
      @order.assign_attributes(post_params)
      if @order.save
        flash.now[:notice] = t('infold.flash.updated')
        render :form
      else
        flash.now[:alert] = t('infold.flash.invalid')
        render :form, status: :unprocessable_entity
      end
    end

    def destroy
      @order = Order.find(params[:id])
      if @order.destroy
        redirect_to admin_orders_path, status: :see_other, flash: { notice: t('infold.flash.destroyed') }
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
      params.require(:admin_order).permit(
        :customer_id,
        order_details_attributes: [
          :id,
          :_destroy,
          :product_id,
          :amount
        ]
      )
    end
  end
end
module Admin
  class OrderSearchForm < BaseSearchForm

    set_condition :id_eq

    def perform(page = nil, limit: nil, csv: false)
      records = Order.includes(:customer).distinct
      records = apply_conditions(records, page, limit, csv)
      apply_sort(records, Order.primary_key)
    end
  end
end
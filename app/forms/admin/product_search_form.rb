module Admin
  class ProductSearchForm < BaseSearchForm

    set_condition :id_eq

    def perform(page = nil, limit: nil, csv: false)
      records = Product.distinct
      records = apply_conditions(records, page, limit, csv)
      apply_sort(records, Product.primary_key)
    end
  end
end
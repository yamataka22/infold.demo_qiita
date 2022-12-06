module Admin
  class Order < ::Order
    belongs_to :customer, foreign_key: 'customer_id'
    has_many :order_details, dependent: :destroy

    accepts_nested_attributes_for :order_details, reject_if: :all_blank, allow_destroy: true
    validates_associated :order_details

    delegate :name, to: :customer, prefix: true, allow_nil: true

    scope :id_eq, ->(v) do
      where(id: v) if v.present?
    end


  end
end

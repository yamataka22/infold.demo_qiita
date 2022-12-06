module Admin
  class OrderDetail < ::OrderDetail
    belongs_to :product, foreign_key: 'product_id'

    delegate :title, to: :product, prefix: true, allow_nil: true

    validates :product_id, presence: true

    scope :id_eq, ->(v) do
      where(id: v) if v.present?
    end


  end
end

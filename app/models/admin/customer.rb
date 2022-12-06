module Admin
  class Customer < ::Customer
    validates :name, presence: true

    enum gender: { male: 1, female: 2, other: 3 }, _prefix: true


    scope :id_eq, ->(v) do
      where(id: v) if v.present?
    end

    scope :name_full_like, ->(v) do
      where(arel_table[:name].matches("%#{v}%")) if v.present?
    end


  end
end

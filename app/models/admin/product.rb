module Admin
  class Product < ::Product
    has_one_attached :photo
    attr_accessor :remove_photo
    before_validation { self.photo = nil if remove_photo.to_s == '1' }


    scope :id_eq, ->(v) do
      where(id: v) if v.present?
    end


  end
end

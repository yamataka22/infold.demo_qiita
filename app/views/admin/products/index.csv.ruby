require 'csv'

CSV.generate do |csv|
  # set title row
  csv << [
    Admin::Product.human_attribute_name(:id),
    Admin::Product.human_attribute_name(:title),
    Admin::Product.human_attribute_name(:price),
    Admin::Product.human_attribute_name(:created_at),
    Admin::Product.human_attribute_name(:updated_at),
  ]
  # set body rows
  @products.each do |product|
    csv << [
      product.id,
      product.title,
      product.price,
      product.created_at,
      product.updated_at,
    ]
  end
end
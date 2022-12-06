require 'csv'

CSV.generate do |csv|
  # set title row
  csv << [
    Admin::Order.human_attribute_name(:id),
    Admin::Order.human_attribute_name(:created_at),
    Admin::Order.human_attribute_name(:updated_at),
    Admin::Order.human_attribute_name(:customer_id),
  ]
  # set body rows
  @orders.each do |order|
    csv << [
      order.id,
      order.created_at,
      order.updated_at,
      order.customer_id,
    ]
  end
end
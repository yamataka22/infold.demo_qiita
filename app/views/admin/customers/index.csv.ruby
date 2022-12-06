require 'csv'

CSV.generate do |csv|
  # set title row
  csv << [
    Admin::Customer.human_attribute_name(:id),
    Admin::Customer.human_attribute_name(:name),
    Admin::Customer.human_attribute_name(:address),
    Admin::Customer.human_attribute_name(:gender),
    Admin::Customer.human_attribute_name(:created_at),
    Admin::Customer.human_attribute_name(:updated_at),
  ]
  # set body rows
  @customers.each do |customer|
    csv << [
      customer.id,
      customer.name,
      customer.address,
      customer.gender_i18n,
      customer.created_at,
      customer.updated_at,
    ]
  end
end
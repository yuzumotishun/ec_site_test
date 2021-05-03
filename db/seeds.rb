# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.create!(
  category_name: "food"
)

sale_status = SaleStatus.create!(
  sale_status_name: "sale"
)

product_status = ProductStatus.create!(
  product_status_name: "on-sale"
)

product = Product.create!(
  product_name: "sample_product",
  price: 1000,
  description: "サンプル製品です。",
  delete_flag: false,
  category_id: category.id,
  sale_status_id: sale_status.id,
  product_status_id: product_status.id
)

Purchase.create!(
  purchase_price: 1000,
  purchase_quantity: 1,
  purchase_company: "架空社",
  product_id: product.id
)

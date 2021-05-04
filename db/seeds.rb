##########################################
# User関連の作成
##########################################
UserClassification.create!(user_classification_name: "購入者")

user1 = User.create!(
    last_name: "山田",
    first_name: "太郎",
    zipcode: "123-4567",
    prefecture: "北海道",
    municipality: "札幌市",
    address: "時計台3-2-1",
    apartments: "旅行したい101",
    phone_number: "08012345678",
    company_name: "有限会社 山田",
    email: "user1@example.com",
    password: "password",
    user_classification_id: 1,
    delete_flag: false
    )

user2 = User.create!(
    last_name: "田中",
    first_name: "二郎",
    zipcode: "234-5678",
    prefecture: "青森県",
    municipality: "青森市",
    address: "りんご3-2-1",
    apartments: "旅行したい102",
    phone_number: "08023456789",
    company_name: "有限会社 田中",
    email: "user2@example.com",
    password: "password",
    user_classification_id: 1,
    delete_flag: false
    )


##########################################
# Product関連の作成
##########################################
category1 = Category.create!(
  category_name: "食料品"
)

category2 = Category.create!(
  category_name: "生活雑貨"
)

sale_status1 = SaleStatus.create!(
  sale_status_name: "20% OFF"
)

sale_status2 = SaleStatus.create!(
  sale_status_name: "40% OFF"
)

product_status1 = ProductStatus.create!(
  product_status_name: "準備中"
)

product_status2 = ProductStatus.create!(
  product_status_name: "出荷"
)

product1 = Product.create!(
  product_name: "りんご",
  price: 110,
  description: "新鮮なりんごです",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id
)

product2 = Product.create!(
  product_name: "ティッシュペーパー",
  price: 300,
  description: "400枚入り × 4箱です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id
)

purchase1 = Purchase.create!(
  purchase_price: 330,
  purchase_quantity: 3,
  purchase_company: "青菜社",
  product_id: product1.id
)

purchase2 = Purchase.create!(
  purchase_price: 600,
  purchase_quantity: 2,
  purchase_company: "紙箱社",
  product_id: product2.id
)

##########################################
# UserClassificationの作成
##########################################
user_classification1 = UserClassification.create!(user_classification_name: "購入者")
user_classification2 = UserClassification.create!(user_classification_name: "販売者")
##########################################
# User関連の作成
##########################################
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
  user_classification_id: user_classification1.id,
  delete_flag: false,
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
  user_classification_id: user_classification2.id,
  delete_flag: false,
)
##########################################
# Productの作成
##########################################
category1 = Category.create!(category_name: "食料品")
category2 = Category.create!(category_name: "生活雑貨")
##########################################
# SaleStatusの作成
##########################################
sale_status1 = SaleStatus.create!(sale_status_name: "20% OFF")
sale_status2 = SaleStatus.create!(sale_status_name: "40% OFF")
##########################################
# ProductStatusの作成
##########################################
product_status1 = ProductStatus.create!(product_status_name: "準備中")
product_status2 = ProductStatus.create!(product_status_name: "出荷")
##########################################
# Productの作成
##########################################
product1 = Product.create!(
  product_name: "りんご",
  price: 110,
  description: "新鮮なりんごです",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user1.id,
)
product2 = Product.create!(
  product_name: "食パン",
  price: 320,
  description: "高級食パンです",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user1.id,
)
product3 = Product.create!(
  product_name: "ティッシュペーパー",
  price: 300,
  description: "400枚入り × 4箱です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product4 = Product.create!(
  product_name: "タオル",
  price: 2980,
  description: "すぐ乾く！速乾タオルです。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product5 = Product.create!(
  product_name: "手袋",
  price: 1180,
  description: "ふかふかのあったかい手袋です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product6 = Product.create!(
  product_name: "じゃがいも",
  price: 130,
  description: "国産のとれたて新鮮なじゃがいもです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product7 = Product.create!(
  product_name: "バナナ",
  price: 230,
  description: "フィリピン産絶妙に甘いバナナです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product8 = Product.create!(
  product_name: "洗剤",
  price: 1460,
  description: "いい香りの洗剤です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product9 = Product.create!(
  product_name: "化粧品",
  price: 1890,
  description: "上質な素材をふんだんに使った化粧水です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product10 = Product.create!(
  product_name: "パイナップル",
  price: 2980,
  description: "熟していてとてもジューシーなパイナップルです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product11 = Product.create!(
  product_name: "ぶどう",
  price: 380,
  description: "一粒一粒がしっかりしてる最上級のぶどうです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product12 = Product.create!(
  product_name: "遮光カーテン",
  price: 4980,
  description: "日光100%カットのカーテンです。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product13 = Product.create!(
  product_name: "玉ねぎ",
  price: 140,
  description: "今が旬の新玉ねぎです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product14 = Product.create!(
  product_name: "ヨギボー",
  price: 23980,
  description: "家にあるとだめになってしまうほどの快適さ！ヨギボーです。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product15 = Product.create!(
  product_name: "にんじん",
  price: 110,
  description: "太陽の恵を受けて育てられた立派なにんじんです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product16 = Product.create!(
  product_name: "コーヒーメーカー",
  price: 12980,
  description: "家でもいつでもカフェ気分。美味しくコーヒーを作れるコーヒーメーカーです。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product17 = Product.create!(
  product_name: "苺のショートケーキ",
  price: 940,
  description: "最高級の苺をふんだんに使った上品なショートケーキです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product18 = Product.create!(
  product_name: "机",
  price: 2980,
  description: "頑丈で大きなアンティーク調の机です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product19 = Product.create!(
  product_name: "どら焼き",
  price: 120,
  description: "栗が詰まっていて大満足のボリューミーなどら焼きです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product20 = Product.create!(
  product_name: "椅子",
  price: 2980,
  description: "背もたれが柔軟に動くアンティーク調の椅子です。",
  delete_flag: false,
  category_id: category2.id,
  sale_status_id: sale_status1.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
product21 = Product.create!(
  product_name: "黒毛和牛",
  price: 3250,
  description: "上質な国産の黒毛和牛です。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status2.id,
  user_id: user2.id,
)
product22 = Product.create!(
  product_name: "みかん",
  price: 180,
  description: "珍しい緑色のみかんです。",
  delete_flag: false,
  category_id: category1.id,
  sale_status_id: sale_status2.id,
  product_status_id: product_status1.id,
  user_id: user2.id,
)
##########################################
# Purchaseの作成
##########################################
Purchase.create!(
  purchase_price: 330,
  purchase_quantity: 67,
  purchase_company: "青菜社",
  product_id: product1.id,
)
Purchase.create!(
  purchase_price: 600,
  purchase_quantity: 24,
  purchase_company: "スーパーばんや",
  product_id: product2.id,
)
Purchase.create!(
  purchase_price: 330,
  purchase_quantity: 53,
  purchase_company: "青菜社",
  product_id: product3.id,
)
Purchase.create!(
  purchase_price: 600,
  purchase_quantity: 32,
  purchase_company: "スーパーばんや",
  product_id: product4.id,
)
##########################################
# Orderの作成
##########################################
order1 = user1.orders.create!(
  order_number: "8418240123",
)
order2 = user2.orders.create!(
  order_number: "6651972394",
)
##########################################
# ShipmentStatusの作成
##########################################
shipment_status1 = ShipmentStatus.create!(
  shipment_status_name: "準備中",
)
shipment_status2 = ShipmentStatus.create!(
  shipment_status_name: "発送済",
)
##########################################
# OrderDetailの作成
##########################################
order1.order_details.create!(
  product_id: product1.id,
  shipment_status_id: shipment_status1.id,
  order_detail_number: "7897128712",
  order_quantity: 2,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)
order1.order_details.create!(
  product_id: product2.id,
  shipment_status_id: shipment_status2.id,
  order_detail_number: "3841856141",
  order_quantity: 1,
  shipment_date: Time.zone.parse("2021-05-12 06:10:53"),
)
order1.order_details.create!(
  product_id: product3.id,
  shipment_status_id: shipment_status2.id,
  order_detail_number: "5691823011",
  order_quantity: 3,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)
order1.order_details.create!(
  product_id: product4.id,
  shipment_status_id: shipment_status1.id,
  order_detail_number: "9126923461",
  order_quantity: 1,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)
order2.order_details.create!(
  product_id: product1.id,
  shipment_status_id: shipment_status2.id,
  order_detail_number: "2296191250",
  order_quantity: 1,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)
order2.order_details.create!(
  product_id: product2.id,
  shipment_status_id: shipment_status1.id,
  order_detail_number: "1273481722",
  order_quantity: 1,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)
order2.order_details.create!(
  product_id: product3.id,
  shipment_status_id: shipment_status2.id,
  order_detail_number: "4123896390",
  order_quantity: 1,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)
order2.order_details.create!(
  product_id: product4.id,
  shipment_status_id: shipment_status1.id,
  order_detail_number: "3727202390",
  order_quantity: 2,
  shipment_date: Time.zone.parse("2021-05-14 10:10:59"),
)

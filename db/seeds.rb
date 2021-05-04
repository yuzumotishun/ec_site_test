UserClassification.create!(user_classification_name: "購入者")

user1 = User.create!(
    last_name: "山田", 
    first_name: "太郎", 
    zipcode: "1234567", 
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
    zipcode: "2345678", 
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


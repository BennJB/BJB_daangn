# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 기본 카테고리 설정
Category.create(title: "차량")
Category.create(title: "가구/인테리어")
Category.create(title: "유아동/유아도서")
Category.create(title: "생활/가공식품")

# 샘플 유저
User.create(email:"abc@gmail.com", name:"당근마켓", password: "123123")

# 샘플 상품
Item.create(user_id: 1, category_id: 1, image: Rails.root.join("app/assets/images/palisade.jpg").open, title:"현대 펠리세이드", price: 30000000, description: "쿨거래, 급하게 처분합니다.", mileage: 5000, caryear: 2019, smokingOptions: true, impressions_count: nil)
Item.create(user_id: 1, category_id: 2, image: Rails.root.join("app/assets/images/merbau.jpg").open, title:"멀바우 원목 테이블", price: 150000, description: "쿨거래, 급하게 처분합니다.", mileage: 0, caryear: 0, smokingOptions: false, impressions_count: nil)
Item.create(user_id: 1, category_id: 3, image: Rails.root.join("app/assets/images/baby.jpg").open, title:"미사용 아기 옷", price: 20000, description: "쿨거래, 급하게 처분합니다.", mileage: 0, caryear: 0, smokingOptions: false, impressions_count: nil)
Item.create(user_id: 1, category_id: 4, image: Rails.root.join("app/assets/images/poland.jpg").open, title:"폴란드 그릇", price: 76000, description: "쿨거래, 급하게 처분합니다.", mileage: 0, caryear: 0, smokingOptions: false, impressions_count: nil)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: "管理者", nickname: "管理者", address: "日本", phone: 1, email: "admin@example.com", password:  "111111", password_confirmation: "111111", admin: true)

food = Category.create(name: "食品")
food_1 = food.children.create(name: "米・雑穀・シリアル")
food_2 = food.children.create(name: "麺類")
food_3 = food.children.create(name: "野菜")
food_4 = food.children.create(name: "水産物・水産加工品")
food_5 = food.children.create(name: "肉・肉加工品")
food_6 = food.children.create(name: "卵・チーズ・乳製品")
food_7 = food.children.create(name: "果物")
food_8 = food.children.create(name: "惣菜・レトルト・冷凍")
food_9 = food.children.create(name: "豆腐・納豆・漬物")
food_10 = food.children.create(name: "パン")
food_11 = food.children.create(name: "ジャム・はちみつ")
food_12 = food.children.create(name: "粉類")
food_13 = food.children.create(name: "乾物")
food_14 = food.children.create(name: "ダイエットフード")
food_15 = food.children.create(name: "缶詰・瓶類")
food_16 = food.children.create(name: "調味料")

sweets = Category.create(name: "スイーツ・お菓子")
sweets_1 = sweets.children.create(name: "洋菓子")
sweets_2 = sweets.children.create(name: "和菓子")
sweets_3 = sweets.children.create(name: "菓子材料")
sweets_4 = sweets.children.create(name: "スナック・駄菓子")
sweets_5 = sweets.children.create(name: "おつまみ・珍味")
sweets_6 = sweets.children.create(name: "ドライフルーツ")

alcohol = Category.create(name: "お酒")
alcohol_1 = alcohol.children.create(name: "ビール・缶ビール")
alcohol_2 = alcohol.children.create(name: "焼酎")
alcohol_3 = alcohol.children.create(name: "日本酒")
alcohol_4 = alcohol.children.create(name: "梅酒")
alcohol_5 = alcohol.children.create(name: "ワイン")
alcohol_6 = alcohol.children.create(name: "ウイスキー")
alcohol_7 = alcohol.children.create(name: "ブランデー")
alcohol_8 = alcohol.children.create(name: "リキュール")

drink = Category.create(name: "水・ソフトドリンク")
drink_1 = drink.children.create(name: "ソフトドリンク")
drink_2 = drink.children.create(name: "コーヒー・ココア")
drink_3 = drink.children.create(name: "ハーブティー")
drink_4 = drink.children.create(name: "日本茶")
drink_5 = drink.children.create(name: "水・ミネラルウォーター")
drink_6 = drink.children.create(name: "中国茶")
drink_7 = drink.children.create(name: "紅茶")

others = Category.create(name: "その他・食品以外（雑貨など）")
others_1 = others.children.create(name: "その他・食品以外（雑貨など）")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Travel.destroy_all
TravelDetail.destroy_all

user1 = User.create!(name: "木村恵輔", email: "kimura@example.com", password: "password")
user2 = User.create!(name: "たけさん", email: "takesan@example.com", password: "password")

travel1 = Travel.create!(country: "スウェーデン", region: "ストックホルム", city: "", travel_plan: "羽田空港からフランスのシャルルドゴール空港に行き、シャルルドゴール空港からスウェーデンのアーランダー空港に到着", user_id: user1.id, latitude: 59.32932349999999, longitude: 18.0685808)
travel2 = Travel.create!(country: "日本", region: "沖縄", city: "", travel_plan: "やんばるCODEから歩いて15分くらいのところにある定食屋さん", user_id: user2.id, latitude: 26.1201911, longitude: 127.7025012)

travel_detail1 = TravelDetail.create!(image: "", content: "ストックホルムの旧市街でガムラスタンの街並みが気に入っています。魔女の宅急便のモデルにもなった街です。スウェーデンに訪れた時は必ず行きます。", travel_id: travel1.id)
travel_detail2 = TravelDetail.create!(image: "", content: "沖縄にある最強食堂という定食屋さんの唐揚げ定食が好きです。", travel_id: travel2.id)

travel1.travel_detail_id = travel_detail1.id
travel2.travel_detail_id = travel_detail2.id

travel1.save!
travel2.save!

puts "初期データの投入に成功しました。"


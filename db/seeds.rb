# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Travel.destroy_all
# Like.destroy_all

user1 = User.create!(email: "kimura@example.com", password: "password")
user2 = User.create!(email: "kakesan@example.com", password: "password")
user3 = User.create!(email: "taichisan@example.com", password: "password")
user4= User.create!(email: "jinbosan@example.com", password: "password")

Travel.create!(country: "スウェーデン", location: "ストックホルム", image: "", content: "ストックホルムにあるガムラスタンの街並みが気に入っていて訪れた時は必ず行きます。", user_id: user1.id)
Travel.create!(country: "スウェーデン", location: "ストックホルム", image: "", content: "ストックホルムにあるガムラスタンの街並みが気に入っていて訪れた時は必ず行きます。", user_id: user1.id)

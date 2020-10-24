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

user1 = User.create!(
  name: "木村恵輔",
  email: "kimura@example.com",
  password: SecureRandom.urlsafe_base64,
)

user2 = User.create!(
  name: "たけさん",
  email: "takesan@example.com",
  password: SecureRandom.urlsafe_base64,
)

# 海外の地域別の初期データ
travel1 = user1.travels.create!(
  country: "スウェーデン",
  region: "ストックホルム",
  city: "ガムラスタン",
  travel_plan: "東京→ストックホルム→東京",
)

travel2 = user1.travels.create!(
  country: "モロッコ",
  region: "カサブランカ",
  city: "シャウエン",
  travel_plan: "東京→ドバイ→カサブランカ→ドバイ→東京",
)

travel3 = user1.travels.create!(
  country: "ニュージーランド",
  region: "クライストチャーチ",
  city: "テカポ",
  travel_plan: "東京→オークランド→クライストチャーチ→オークランド→東京",
)

travel4 = user1.travels.create!(
  country: "日本",
  region: "静岡県",
  city: "富士市",
  travel_plan: "東京→静岡→東京",
)

travel5 = user1.travels.create!(
  country: "アメリカ",
  region: "アリゾナ",
  city: "グランドキャニオン国立公園",
  travel_plan: "東京→ラスベガス→サウスリム→ラスベガス→東京",
)

travel6 = user1.travels.create!(
  country: "ブラジル",
  region: "リオデジャネイロ",
  city: "コルコバード",
  travel_plan: "東京→フランクフルト→サンパウロ→フランクフルト→東京",
)

# 日本の地域別の初期データ
travel7 = user1.travels.create!(
  country: "日本",
  region: "北海道",
  city: "函館市",
  travel_plan: "東京→北海道→東京",
)

travel8 = user1.travels.create!(
  country: "日本",
  region: "青森県",
  city: "弘前市",
  travel_plan: "東京→青森→東京",
)

travel9 = user1.travels.create!(
  country: "日本",
  region: "群馬県",
  city: "草津町",
  travel_plan: "東京→群馬→東京",
)

travel10 = user1.travels.create!(
  country: "日本",
  region: "岐阜県",
  city: "白川村",
  travel_plan: "東京→岐阜→東京",
)

travel11 = user1.travels.create!(
  country: "日本",
  region: "兵庫県",
  city: "姫路市",
  travel_plan: "東京→兵庫→東京",
)

travel12 = user1.travels.create!(
  country: "日本",
  region: "徳島県",
  city: "鳴門市",
  travel_plan: "東京→徳島→東京",
)

travel13 = user1.travels.create!(
  country: "日本",
  region: "沖縄県",
  city: "美ら海水族館",
  travel_plan: "東京→沖縄→東京",
)

# 海外の地域別の初期データ
travel_detail1 = travel1.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/1.jpg"),
  content: "ストックホルムの旧市街のガムラスタンの街並みが気に入っています。魔女の宅急便のモデルにもなった場所です。大きな時計台のある湖に囲まれた美しい街です。",
)

travel_detail2 = travel2.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/2.jpg"),
  content: "シャウエンはモロッコ北部にある美しいブルーの町は「おとぎの国」と言われています。建物の壁や道路、階段も、すべてブルーでペイントされています。",
)

travel_detail3 = travel3.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/3.jpg"),
  content: "ニュージーランドにある「テカポ湖」は世界一星空が美しいと言われています。運がよければオーラが見れることがあります。テカポ湖の星空は一生に一度は見てみたいです。",
)

travel_detail4 = travel4.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/4.jpg"),
  content: "誰もが知る日本一の山である富士山です。世界遺産にも登録されて、世界中に知られた存在です。登山が好きなのでいつかは登ってみたいです。",
)

travel_detail5 = travel5.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/5.jpg"),
  content: "アメリカを代表する国立公園です。一番の魅力はそのスケールの大きさです。地球の歴史と大自然を肌で実感できる場所です。",
)

travel_detail6 = travel6.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/6.jpg"),
  content: "リオデジャネイロの象徴ともいえる巨大なキリスト像は、1931年のブラジル独立100周年を記念して、丘の上に建設されたものです。",
)

# 日本の地域別の初期データ
travel_detail7 = travel7.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/7.jpg"),
  content: "世界三大夜景に数えられる函館山からの夜景は感動的です。歴史を感じられる建築物や美味しい食事など、魅力的な観光スポットです。",
)

travel_detail8 = travel8.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/8.jpg"),
  content: "弘前市のりんごは生産量日本一です。道の駅で販売しているりんごは本当に美味しいので毎回沢山購入してしまいます。",
)

travel_detail9 = travel9.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/9.jpg"),
  content: "日本一の自然湧出量が自慢の草津温泉には湯畑があり、湯もみも体験することができます。",
)

travel_detail10 = travel10.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/10.jpg"),
  content: "白川郷はユネスコの世界遺産に登録されています。白川郷では結の心が大切にされていて、子供から大人まで人と人のつながりを大切にしています。",
)

travel_detail11 = travel11.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/11.jpg"),
  content: "国宝である姫路城は日本の伝統的な美しい風景が楽しめる場所として人気があります。",
)

travel_detail12 = travel12.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/12.jpg"),
  content: "鳴門といえば渦潮で有名ですが、他にも大塚国際美術館や夜景が有名です。
  渦潮は世界三大潮流のひとつになります。",
)

travel_detail13 = travel13.travel_details.create!(
  image: File.open("#{Rails.root}/public/images/seeds/13.jpg"),
  content: "巨大水槽の中には全長8.8メートルのジンベイザメをはじめ、世界初の繁殖に成功したナンヨウマンタが観察できます。水槽のアクリルパネルは、高さ8.2m、幅22.5m、厚さ60cmもあります。",
)

# お気に入り機能の部分
8.times do |i|
  User.create!(
    name: "test-user-#{i}",
    email: "test#{i}@example.com",
    password: SecureRandom.urlsafe_base64,
  )
end

Travel.all.each do |travel|
  # 投稿者以外の user_id の配列
  user_ids = User.ids - [travel.user_id]
  user_ids.each do |user_id|
    Favorite.create!(user_id: user_id, travel_id: travel.id) if rand(2).odd?
  end
end

puts "初期データの投入に成功しました。"

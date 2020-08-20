# Label.seed(
#   :id,
#   { id: 1, name: '新鮮' },
#   { id: 2, name: '送料無料' },
#   { id: 3, name: '予約' },
# )

Producer.seed(
  :id,
  { id: 4, producer_name: Faker::Movies::BackToTheFuture.character , email: Faker::Internet.email, producer_postal_code: '7372213', producer_prefecture_code: '広島県', producer_address_city: '江田島市大柿町大原', producer_address_street: '505', producer_address_building: '江田島農場', password: 'password', admin: false },
  { id: 5, producer_name: Faker::Movies::BackToTheFuture.character , email: Faker::Internet.email, producer_postal_code: '4048501', producer_prefecture_code: '山梨県', producer_address_city: '甲州市塩山上於曽', producer_address_street: '1085-1', producer_address_building: '勝沼フルーツ園', password: 'password', admin: false },
  { id: 6, producer_name: Faker::Movies::BackToTheFuture.character , email: Faker::Internet.email, producer_postal_code: '9920012', producer_prefecture_code: '山形県', producer_address_city: '米沢市金池', producer_address_street: '5-2-25', producer_address_building: '米沢農場', password: 'password', admin: false },
  { id: 7, producer_name: Faker::Movies::BackToTheFuture.character , email: Faker::Internet.email, producer_postal_code: '0708525', producer_prefecture_code: '北海道', producer_address_city: '旭川市6条通り', producer_address_street: '6-9', producer_address_building: '旭川農園', password: 'password', admin: false },
  { id: 8, producer_name: Faker::Movies::BackToTheFuture.character , email: Faker::Internet.email, producer_postal_code: '8978501', producer_prefecture_code: '鹿児島県', producer_address_city: '南さつま市加世田川畑', producer_address_street: '2648', producer_address_building: '南さつま園', password: 'password', admin: false },
  { id: 9, producer_name: Faker::Movies::BackToTheFuture.character , email: Faker::Internet.email, producer_postal_code: '7938601', producer_prefecture_code: '愛媛県', producer_address_city: '西条市明屋敷', producer_address_street: '1-6-4', producer_address_building: '西条農園', password: 'password', admin: false },
)

producer = Producer.find(4)
producer.producer_avatar.attach(io: File.open('./db/fixtures/image/nouka6.jpeg'), filename: './db/fixtures/image/nouka6.jpeg')

producer = Producer.find(5)
producer.producer_avatar.attach(io: File.open('./db/fixtures/image/nouka8.jpeg'), filename: './db/fixtures/image/nouka8.jpeg')

producer = Producer.find(6)
producer.producer_avatar.attach(io: File.open('./db/fixtures/image/nouka9.jpeg'), filename: './db/fixtures/image/nouka9.jpeg')

producer = Producer.find(7)
producer.producer_avatar.attach(io: File.open('./db/fixtures/image/nouka2.jpeg'), filename: './db/fixtures/image/nouka2.jpeg')

producer = Producer.find(8)
producer.producer_avatar.attach(io: File.open('./db/fixtures/image/nouka.jpeg'), filename: './db/fixtures/image/nouka.jpeg')

producer = Producer.find(9)
producer.producer_avatar.attach(io: File.open('./db/fixtures/image/nouka5.jpeg'), filename: './db/fixtures/image/nouka5.jpeg')



Product.seed(
  :id,
  { id: 19, title: 'フルーツ詰め合わせ', price: 2000, quantity: 2, content: '無農薬で育てているため、甘さが際立っています！', harvest_date: '2020-08-15', farm_name: '江田島農場', farm_street_address: '広島県江田島市大柿町大原505', producer_id: 5 },
  { id: 20, title: '甲州ぶどうの詰め合わせ', price: 1800, quantity: 4, content: '産地、勝沼で育った甘い甘い葡萄をご賞味ください！！', harvest_date: '2020-08-11', farm_name: '勝沼フルーツ園', farm_street_address: '山梨県甲州市塩山上於曽1085-1', producer_id: 6 },
  { id: 21, title: 'さくらんぼの詰め合わせ', price: 2100, quantity: 2, content: '山形といえばさくらんぼ！徹底した管理のもとで育ったうちの商品は何処にも負けません。', harvest_date: '2020-08-15', farm_name: '米沢農場', farm_street_address: '山形県米沢市金池5-2-25', producer_id: 7 },
  { id: 22, title: '野菜詰め合わせ', price: 2200, quantity: 1, content: '北の大地で育った野菜はとても水々しいです！！', harvest_date: '2020-08-10', farm_name: '旭川農園', farm_street_address: '北海道旭川市6条通り6-9', producer_id: 8 },
  { id: 23, title: 'マンゴー詰め合わせ', price: 1700, quantity: 3, content: '宮崎のマンゴーには負けん！', harvest_date: '2020-08-16', farm_name: '南さつま園', farm_street_address: '鹿児島県南さつま市加世田川畑2648', producer_id: 9 },
)

product = Product.find(19)
product.image.attach(io: File.open('./db/fixtures/image/fruits.jpeg'), filename: './db/fixtures/image/fruits.jpeg')

product = Product.find(20)
product.image.attach(io: File.open('./db/fixtures/image/grape.jpeg'), filename: './db/fixtures/image/grape.jpeg')

product = Product.find(21)
product.image.attach(io: File.open('./db/fixtures/image/cherry.jpeg'), filename: './db/fixtures/image/cherry.jpeg')

product = Product.find(22)
product.image.attach(io: File.open('./db/fixtures/image/vegetables.jpeg'), filename: './db/fixtures/image/vegetables.jpeg')

product = Product.find(23)
product.image.attach(io: File.open('./db/fixtures/image/mango.jpeg'), filename: './db/fixtures/image/mango.jpeg')

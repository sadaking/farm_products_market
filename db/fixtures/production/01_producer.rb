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

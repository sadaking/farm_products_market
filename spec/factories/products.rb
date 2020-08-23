FactoryBot.define do
  factory :product do
    title { '野菜詰め合わせ' }
    price { '2000' }
    quantity { '3' }
    after(:build) do |product|
      product.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'vegetables.jpeg')), filename: 'vegetables.jpeg', content_type: 'image/jpeg')
    end
    content { 'めっちゃ美味しい！！' }
    harvest_date { '2020-08-10　00:00:00' }
    farm_name { 'TS農園' }
    farm_street_address { '長野県松本市松本' }
  end

  factory :second_product, class: Product do
    title { 'フルーツ詰め合わせ' }
    price { '2500' }
    quantity { '2' }
    after(:build) do |product|
      product.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'fruits.jpeg')), filename: 'fruits.jpeg', content_type: 'image/jpeg')
    end
    content { 'めっちゃ甘い！！' }
    harvest_date { '2020-08-03　00:00:00' }
    farm_name { 'TS農園' }
    farm_street_address { '山形県米沢市米沢' }
  end
end

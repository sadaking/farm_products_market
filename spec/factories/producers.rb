FactoryBot.define do
  factory :producer do
    id { 50 }
    producer_name { 'NoukaTaro' }
    email { 'Nouka@example.com' }
    producer_postal_code { '7295121' }
    producer_prefecture_code {'広島県'}
    producer_address_city {"庄原市東城町"}
    producer_address_street {"1-40-6"}
    producer_address_building {"東城農園"}
    password { 'producertest' }
    admin { false }
  end
  factory :second_producer, class: Producer do
    id { 20 }
    producer_name { 'secondproducer' }
    email { 'producer2@example.com' }
    producer_postal_code { '1500044' }
    producer_prefecture_code {'東京都'}
    producer_address_city {"渋谷区円山町"}
    producer_address_street {"28-4"}
    producer_address_building {"大場ビル"}
    password { 'secondproducertest' }
    admin { false }
  end
end

require 'rails_helper'
RSpec.describe '出品製品の管理機能', type: :model do
  it 'producer_nameが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: '',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'emailが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'producer_postal_codeが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'producer_prefecture_codeが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'producer_address_cityが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'producer_address_streetが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'producer_address_buildingが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'',
      password: 'producertest',
    )
    expect(producer).not_to be_valid
  end

  it 'passwordが空ならバリデーションが通らない' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: '',
    )
    expect(producer).not_to be_valid
  end

  it '内容が記載されていればバリデーションが通る' do
    producer = Producer.new(
      id: 50,
      producer_name: 'NoukaTaro',
      email:'Nouka@example.com',
      producer_postal_code:'7295121',
      producer_prefecture_code:'広島県',
      producer_address_city:'庄原市東城町',
      producer_address_street:'1-40-6',
      producer_address_building:'東城農園',
      password: 'producertest',
    )
    expect(producer).to be_valid
  end
end

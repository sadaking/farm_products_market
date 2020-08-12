require 'rails_helper'
RSpec.describe '出品製品の管理機能', type: :model do
  it 'nameが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: '',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).not_to be_valid
  end

  it 'emailが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).not_to be_valid
  end

  it 'postal_codeが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).not_to be_valid
  end

  it 'prefecture_codeが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).not_to be_valid
  end

  it 'address_cityが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).not_to be_valid
  end

  it 'address_streetが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).not_to be_valid
  end

  it 'address_buildingが空でもバリデーションが通る' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'',
      password: 'usertest',
    )
    expect(user).to be_valid
  end

  it 'passwordが空ならバリデーションが通らない' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: '',
    )
    expect(user).not_to be_valid
  end

  it '内容が記載されていればバリデーションが通る' do
    user = User.new(
      id: 100,
      name: 'sample',
      email:'sample@example.com',
      postal_code:'1000014',
      prefecture_code:'東京都',
      address_city:'千代田区永田町',
      address_street:'1-7-1',
      address_building:'国会議事堂',
      password: 'usertest',
    )
    expect(user).to be_valid
  end
end

require 'rails_helper'
RSpec.describe '出品製品の管理機能', type: :model do

  before do
    @producer = FactoryBot.create(:producer)
  end

  it "has a valid factory of user" do
    producer = @producer
    expect(producer).to be_valid
  end

  it 'titleが空ならバリデーションが通らない' do
    product = Product.new(
      title: '',
      price:'2000',
      quantity:'3',
      content:'めっちゃ美味しい！！',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'TS農園',
      farm_street_address:'長野県松本市松本',
      producer_id: 50
    )
    expect(product).not_to be_valid
  end

  it 'priceが空ならバリデーションが通らない' do
    product = Product.new(
      title: '野菜詰め合わせ',
      price:'',
      quantity:'3',
      content:'めっちゃ美味しい！！',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'TS農園',
      farm_street_address:'長野県松本市松本',
      producer_id: 50
    )
    expect(product).not_to be_valid
  end

  it 'quantityが空ならバリデーションが通らない' do
    product = Product.new(
      title: '野菜詰め合わせ',
      price:'2000',
      quantity:'',
      content:'めっちゃ美味しい！！',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'TS農園',
      farm_street_address:'長野県松本市松本',
      producer_id: 50
    )
    expect(product).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    product = Product.new(
      title: '野菜詰め合わせ',
      price:'2000',
      quantity:'3',
      content:'',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'TS農園',
      farm_street_address:'長野県松本市松本',
      producer_id: 50
    )
    expect(product).not_to be_valid
  end

  it 'farm_nameが空ならバリデーションが通らない' do
    product = Product.new(
      title: '野菜詰め合わせ',
      price:'2000',
      quantity:'3',
      content:'めっちゃ美味しい！！',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'',
      farm_street_address:'長野県松本市松本',
      producer_id: 50
    )
    expect(product).not_to be_valid
  end

  it 'farm_street_addressが空ならバリデーションが通らない' do
    product = Product.new(
      title: '野菜詰め合わせ',
      price:'2000',
      quantity:'3',
      content:'めっちゃ美味しい！！',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'TS農園',
      farm_street_address:'',
      producer_id: 50
    )
    expect(product).not_to be_valid
  end

  it '内容が記載されていればバリデーションが通る' do
    product = Product.new(
      title: '野菜詰め合わせ',
      price:'2000',
      quantity:'3',
      content:'めっちゃ美味しい！！',
      harvest_date:'2020-08-10　00:00:00',
      farm_name:'TS農園',
      farm_street_address:'長野県松本市松本',
      producer_id: 50
    )
    expect(product).to be_valid
  end
end

RSpec.describe 'scope検索', type: :model do
  context 'scopeメソッドで検索をした場合' do
    before do
      @producer = FactoryBot.create(:producer)
      FactoryBot.create(:product,producer: @producer)
      FactoryBot.create(:second_product,producer: @producer)
    end
    it "scopeメソッドでタイトル検索ができる" do
      expect(Product.title_search('フルーツ詰め合わせ').count).to eq 1
    end
  end
end

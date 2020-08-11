require 'rails_helper'
RSpec.describe '生産者出品機能と商品検索と詳細機能とコメント機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @producer = FactoryBot.create(:producer)
    @product = FactoryBot.create(:product,producer: @producer)
    @label = FactoryBot.create(:label)
    FactoryBot.create(:labeling, product:@product, label:@label)
    @second_producer = FactoryBot.create(:second_producer)
    @second_product = FactoryBot.create(:second_product, producer: @producer)
  end

  def user_login
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    find('#login').click
  end

  def producer_login
    visit new_producer_session_path
    fill_in 'producer[email]', with: @producer.email
    fill_in 'producer[password]', with: @producer.password
    find('#login').click
  end


  describe '生産品出品画面' do
    context '生産品出品画面で出品商品を作成したい場合' do
      it '商品を出品する' do
        producer_login
        visit products_path
        visit new_product_path
        fill_in 'product[title]', with: 'フルーツ詰め合わせ'
        fill_in 'product[price]', with: '2000'
        fill_in 'product[quantity]', with: '3'
        fill_in 'product[content]', with: '美味しいよ！！'
        fill_in 'product[harvest_date]', with: '2020/07/31'
        fill_in 'product[farm_name]', with: 'TS農園'
        fill_in 'product[farm_street_address]', with: '長野県松本市'
        check "新鮮"
        click_on 'sell'
        expect(page).to have_content '商品一覧'
      end
    end
    context 'scopeメソッドで検索をした場合' do
      it "scopeメソッドでタイトル検索ができる" do
        producer_login
        visit products_path
        fill_in 'title', with: '野菜詰め合わせ'
        click_on '検索する'
        expect(page).to have_content '野菜詰め合わせ'
      end
    end
    context "ラベル検索で絞り込みをかけた場合" do
      it "ラベル検索でタスクが絞られる" do
        producer_login
        visit products_path
        select "新鮮", from:"label_id"
        click_on "検索する"
        product_list = all(".product_label")
        expect(page).to have_content "新鮮"
      end
    end
  end

  describe '商品詳細画面' do
    context '商品詳細画面に遷移した場合' do
     it '該当タスクの内容が表示されたページに遷移する' do
       product_id = FactoryBot.create(:product,producer: @producer)
       user_login
       visit product_path(product_id)
       expect(page).to have_content '野菜詰め合わせ'
     end
    end
  end

  describe 'コメント機能' do
    context '商品に対してコメントを寄せる場合' do
      it '商品に対してコメントができる' do
        product_id = FactoryBot.create(:product,producer: @producer)
        user_login
        visit product_path(product_id)
        fill_in 'comment[content]', with: '美味しそう！！！'
        find('#create_comment').click
        expect(page).to have_content '美味しそう！！！'
      end

      it '投稿したコメントを編集できる' do
        product_id = FactoryBot.create(:product,producer: @producer)
        user_login
        visit product_path(product_id)
        fill_in 'comment[content]', with: '美味しそう！！！'
        find('#create_comment').click
        click_on 'コメント編集'
        fill_in 'ここに編集するコメントを入力します', with: 'うまそう！！！'
        find('#edit_comment').click
        expect(page).to have_content 'うまそう！！！'
      end

      it '投稿したコメントを削除できる' do
        product_id = FactoryBot.create(:product,producer: @producer)
        user_login
        visit product_path(product_id)
        fill_in 'comment[content]', with: '美味しそう！！！'
        find('#create_comment').click
        click_on 'コメント削除'
        expect(page).to have_content '商品詳細画面'
      end
    end

    describe 'お気に入り機能' do
      context 'ユーザーが出品商品のお気に入りリストに追加する' do
        it '出品商品のお気に入りができる' do
          product_id = FactoryBot.create(:product,producer: @producer)
          user_login
          visit product_path(product_id)
          click_on 'お気に入りリストへ'
          expect(page).to have_content 'お気に入り登録しました'
        end

        it 'お気に入りリストからお気に入り登録した商品を閲覧する' do
          product_id = FactoryBot.create(:product,producer: @producer)
          user_login
          visit product_path(product_id)
          click_on 'お気に入りリストへ'
          find('#navbarDropdown').click
          click_on 'プロフィール'
          click_on 'お気に入りリスト'
          expect(page).to have_content @product.title
        end

        it 'お気に入り登録を解除する' do
          product_id = FactoryBot.create(:product,producer: @producer)
          user_login
          visit product_path(product_id)
          click_on 'お気に入りリストへ'
          find('#navbarDropdown').click
          click_on 'プロフィール'
          click_on 'お気に入りリスト'
          click_on '詳細'
          click_on 'お気に入り解除する'
          expect(page).to have_content 'お気に入り解除しました'
        end
      end
    end

    describe 'メッセージ機能' do
      context 'ユーザーと生産者がメッセージでコンタクトが取れる' do
        it 'ユーザーがメッセージ先一覧画面に遷移できる' do
          user_login
          click_on '生産者とのメッセージ'
          expect(page).to have_content @producer.producer_name
        end

        it 'ユーザーが生産者にメッセージを送るためにメッセージルームを作る' do
          user_login
          click_on '生産者とのメッセージ'
          click_on 'Create Room', match: :first
          fill_in 'message[content]', with: '初めまして！！'
          click_on 'メッセージを送る'
          expect(page).to have_content '初めまして！！'
        end

        it '生産者がユーザーにメッセージを送るためにメッセージルームを作る' do
          producer_login
          click_on 'ユーザーとのメッセージ'
          click_on 'Create Room', match: :first
          fill_in 'message[content]', with: '初めまして！！'
          click_on 'メッセージを送る'
          expect(page).to have_content '初めまして！！'
        end
      end
    end
  end
end

require 'rails_helper'
RSpec.describe '生産者登録・ログイン・ログアウト機能', type: :system do
  describe '生産者登録のテスト' do
    context '生産者のデータがなくログインしていない場合' do
      it '生産者新規登録のテスト' do
        visit new_producer_registration_path
        fill_in 'producer[producer_name]', with: 'NoukaTaro'
        fill_in 'producer[email]', with: 'Nouka@example.com'
        fill_in 'producer[producer_postal_code]', with: '7295121'
        select '広島県', from: "producer_producer_prefecture_code"
        fill_in 'producer[producer_address_city]', with: '庄原市東城町'
        fill_in 'producer[producer_address_street]', with: '1-40-6'
        fill_in 'producer[producer_address_building]', with: '東城農園'
        fill_in 'producer[password]', with: 'producertest'
        fill_in 'producer[password_confirmation]', with: 'producertest'
        click_on 'アカウント登録'
        expect(page).to have_content "アカウント登録が完了しました。"
      end
    end
  end

  describe "セッション機能のテスト" do
    before do
      @producer = FactoryBot.create(:producer)
    end
    context "生産者データがあってログインしていない状態" do
      it "ログインができること" do
        visit new_producer_session_path
        fill_in 'producer[email]', with: @producer.email
        fill_in 'producer[password]', with: @producer.password
        find('#login').click
        expect(page).to have_content "ログインしました。"
      end
    end

    context "生産者のデータがあってログインしている場合" do
      before do
        visit new_producer_session_path
        fill_in "producer[email]", with: "Nouka@example.com"
        fill_in "producer[password]", with: "producertest"
        find('#login').click
      end

      it "自分の詳細画面(マイページ)に飛べること" do
        visit producer_path(id: @producer.id)
        expect(current_path).to eq producer_path(id: @producer.id)
      end

      it "生産者が他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
        @second_producer = FactoryBot.create(:second_producer)
        visit producer_path(id: @second_producer.id)
        expect(page).to have_content "他の人のプロフィール画面へはアクセスが出来ません。"
      end

      it "ログアウトができること" do
       visit products_path
       find('#navbarDropdown').click
       click_on "ログアウト"
       expect(page).to have_content "ログアウトしました。"
     end
    end
  end
end

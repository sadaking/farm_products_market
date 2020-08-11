require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザのデータがなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'sample@gmail.com'
        fill_in 'user[postal_code]', with: '1000014'
        select '東京都', from: "user_prefecture_code"
        fill_in 'user[address_city]', with: '千代田区永田町'
        fill_in 'user[address_street]', with: '1-7-1'
        fill_in 'user[address_building]', with: '国会議事堂'
        fill_in 'user[password]', with: 'usertest'
        fill_in 'user[password_confirmation]', with: 'usertest'
        click_on 'アカウント登録'
        expect(page).to have_content "アカウント登録が完了しました。"
      end
    end
  end

  describe "セッション機能のテスト" do
    before do
      @user = FactoryBot.create(:user)
    end
    context "ユーザーデータがあってログインしていない状態" do
      it "ログインができること" do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        find('#login').click
        expect(page).to have_content "ログインしました。"
      end
    end

    context "ユーザーのデータがあってログインしている場合" do
      before do
        visit new_user_session_path
        fill_in "user[email]", with: "sample@example.com"
        fill_in "user[password]", with: "usertest"
        find('#login').click
      end

      it "自分の詳細画面(マイページ)に飛べること" do
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end

      it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
        @admin_user = FactoryBot.create(:admin_user)
        visit user_path(id: @admin_user.id)
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

  describe "管理画面のテスト" do
    context "管理者ユーザーを持っている場合" do
      it "管理者は管理画面にアクセスできること" do
        FactoryBot.create(:admin_user)
        visit new_user_session_path
        fill_in "user[email]", with: "sample2@example.com"
        fill_in "user[password]", with: "adminusertest"
        find('#login').click
        visit rails_admin_path
        expect(page).to have_content "サイト管理"
      end
    end

    # context "一般ユーザーでログインをしている場合" do
    #   it "一般ユーザは管理画面にアクセスできないこと" do
    #     FactoryBot.create(:user)
    #     visit new_user_session_path
    #     fill_in "user[email]", with: "sample@example.com"
    #     fill_in "user[password]", with: "usertest"
    #     find('#login').click
    #     visit rails_admin_path
    #     expect(page).to have_content "あなたは管理者ではありません"
    #   end
    # end
  end
end

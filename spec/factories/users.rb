FactoryBot.define do
  factory :user do
    id { 100 }
    name { 'sample' }
    email { 'sample@example.com' }
    postal_code { '1000014' }
    prefecture_code {'東京都'}
    address_city {"千代田区永田町"}
    address_street {"1-7-1"}
    address_building {"国会議事堂"}
    password { 'usertest' }
    admin { false }
  end
  factory :admin_user, class: User do
    id { 2 }
    name { 'adminsample' }
    email { 'sample2@example.com' }
    postal_code { '1500044' }
    prefecture_code {'東京都'}
    address_city {"渋谷区円山町"}
    address_street {"28-4"}
    address_building {"大場ビル"}
    password { 'adminusertest' }
    admin { true }
  end
end

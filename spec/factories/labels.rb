FactoryBot.define do
  factory :label do
     name { "新鮮" }
  end
  factory :second_label , class: Label do
    name { "送料無料" }
  end
end

FactoryBot.define do
  # 以下のように記述することでUserクラス(Userモデル)だと自動で判断してくれます
  factory :score do
    user
    # nameに保存する内容をランダムに生成します
    total_score  {Faker::Number.between(from: 0, to: 300)}
    # emailを自動で生成します
    competition_score  {Faker::Number.between(from: 0, to: 100)}
    # passwordは確認用も含め同じ値を2度入力しないといけないのでランダムに生成した値を変数化します
    # deviseのpasswordは6文字以上でないといけないのでmin_lengthで6文字以上に設定します
    love_score  {Faker::Number.between(from: 0, to: 100)}
    # passwordとパスワードの確認枠に上記で設定した変数を設定します
    money_score  {Faker::Number.between(from: 0, to: 100)}

    draw_count  {Faker::Number.between(from: 0, to: 100)}

  end
end

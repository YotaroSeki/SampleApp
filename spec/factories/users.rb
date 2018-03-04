FactoryBot.define do
  factory :login_user, class: User do
    name 'Meu Meu'
    email 'meumeu@example.com'
    password 'meumeu'
  end

  factory :other_user, class: User do
    name 'Foo Bar'
    email 'foobar@example.com'
    password 'foobar'
    after(:create) do |user|
      create_list(:micropost, 30, user: user)
    end
  end
end

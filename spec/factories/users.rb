FactoryBot.define do
  factory :login_user, class: User do
    name 'Meu Meu'
    email 'meumeu@example.com'
    password 'meumeu'

    after(:create) do |login_user|
      begin
        create(:favorite, user: login_user, micropost: create(:micropost, user: login_user))
      rescue => e
        p e
      end
    end
  end

  factory :other_user, class: User do
    name 'Foo Bar'
    email 'foobar@example.com'
    password 'foobar'
  end
end

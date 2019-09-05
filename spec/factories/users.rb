FactoryBot.define do
  factory :user do
    email {"droberts@gmail.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end

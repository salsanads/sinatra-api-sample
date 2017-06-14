require './models/user'

FactoryGirl.define do
  factory :user do |u|
    u.username 'harry'
    u.email 'harry@mail.com'
    u.name 'Harry Potter'
  end

  factory :user2, class: User do |u|
    u.username 'hermionegranger'
    u.email 'hermionegranger@gmail.com'
    u.name 'Hermione Granger'
  end
end

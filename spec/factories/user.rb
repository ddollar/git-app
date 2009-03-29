Factory.define :user do |f|
  f.sequence(:email)      { |n| "user#{n}@example.org" }
  f.password              'password'
  f.password_confirmation 'password'
  f.admin                 false
end

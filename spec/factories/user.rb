Factory.define :user do |f|
  f.sequence(:email)      { |n| "user#{n}@example.org" }
  f.ssh_key               'ssh_key'
  f.password              'password'
  f.password_confirmation 'password'
  f.admin                 false
end

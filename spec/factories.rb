FactoryBot.define do
  factory(:park) do
    name {'Cool Park'}
    state {'Oregon'}
  end
  factory(:user) do
    User.destroy_all
    name {'Test User'}
    email {'test@test.com'}
    password {'123'}
  end
end

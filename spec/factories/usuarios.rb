FactoryGirl.define do
  factory :usuario do
    nome 'Usuário'
    sequence(:email) { |n| "teste_#{n}@teste.com" }
    password 'senha_teste'
  end

end

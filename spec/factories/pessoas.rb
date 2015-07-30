FactoryGirl.define do
  factory :pessoa do
    nome 'Nome da Pessoa'
    sequence(:email) { |n| "email_#{n}@teste.com"}
    empresa 'Empresa'
    instituicao 'Instituição'
  end
end
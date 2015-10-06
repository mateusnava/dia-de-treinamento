FactoryGirl.define do
  factory :evento do
    nome 'Nome do Evento'
    vagas 1
    data_evento { Date.current }
  end

end

FactoryGirl.define do
  factory :inscricao do
    association(:pessoa)
    association(:evento)

    factory :inscricao_nao_participante do
      participou false
    end

    factory :inscricao_participante do
      participou true
    end
  end

end

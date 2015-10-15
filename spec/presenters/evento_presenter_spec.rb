require 'rails_helper'

RSpec.describe EventoPresenter, type: :presenter do
  describe '#percentual_ocupacao' do
    context 'quando evento não tiver nenhuma inscrição' do
      it 'deve retornar 0' do
        presenter = EventoPresenter.new(create(:evento))

        resultado = presenter.percentual_ocupacao

        expect(resultado).to eq(0)
      end
    end

    context 'quando o evento tiver inscrições' do
      it 'deve retornar 50 quando metade da capacidade estiver preenchida' do
        presenter = EventoPresenter.new(create(:evento, vagas: 4))
        2.times{ create(:inscricao, evento_id: presenter.id) }

        resultado = presenter.percentual_ocupacao

        expect(resultado).to eq(50.0)
      end

      it 'deve retornar 100 quando toda a capacidade estiver preenchida' do
        presenter = EventoPresenter.new(create(:evento, vagas: 3))
        3.times{ create(:inscricao, evento_id: presenter.id) }

        resultado = presenter.percentual_ocupacao

        expect(resultado).to eq(100.0)
      end
    end
  end

  describe '#lotado?' do
    context 'quando evento não tiver nenhuma inscrição' do
      it 'deve retornar false' do
        presenter = EventoPresenter.new(create(:evento))

        resultado = presenter.lotado?

        expect(resultado).to_not be
      end
    end

    context 'quando o evento tiver inscrições' do
      it 'deve false quando ainda houverem vagas' do
        presenter = EventoPresenter.new(create(:evento, vagas: 2))
        create(:inscricao, evento_id: presenter.id)

        resultado = presenter.lotado?

        expect(resultado).to_not be
      end

      it 'deve retornar true quando não houverem mais vagas' do
        presenter = EventoPresenter.new(create(:evento, vagas: 1))
        create(:inscricao, evento_id: presenter.id)

        resultado = presenter.lotado?

        expect(resultado).to be
      end
    end
  end
end
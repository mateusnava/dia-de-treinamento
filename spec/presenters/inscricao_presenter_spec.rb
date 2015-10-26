require 'rails_helper'

RSpec.describe InscricaoPresenter, type: :presenter do
  describe '#exibir_participou?' do
    context 'deve exibir' do
      it 'quando evento for passado' do
        evento_passado = build(:evento, data_evento: Date.current - 1.day)
        presenter = InscricaoPresenter.new(build(:inscricao, evento: evento_passado))

        resultado = presenter.exibir_participou?

        expect(resultado).to be
      end
    end

    context 'não deve exibir' do
      it 'quando evento for futuro' do
        evento_futuro = build(:evento, data_evento: Date.current + 1.day)
        presenter = InscricaoPresenter.new(build(:inscricao, evento: evento_futuro))

        resultado = presenter.exibir_participou?

        expect(resultado).to_not be
      end
    end
  end

  describe '#wrap' do
    it 'deve transformar toda a lista em objetos do tipo EventoPresenter' do
      create(:inscricao)

      resultado = InscricaoPresenter.wrap(Inscricao.all)

      resultado.each do |presenter|
        expect(presenter).to be_a_kind_of(InscricaoPresenter)
      end
    end
  end

  describe '#destacar_ausente?' do
    it 'deve exibir para eventos finalizados' do
        evento_passado = build(:evento, data_evento: Date.current - 1.day)
        incricao_ausente_de_evento_passado = build(:inscricao, evento: evento_passado, participou: false)
        presenter = InscricaoPresenter.new(incricao_ausente_de_evento_passado)

        expect(presenter.destacar_ausente?).to be
    end

    it 'não deve exibir para eventos em aberto' do
        evento_futuro = build(:evento, data_evento: Date.current + 1.day)
        incricao_ausente_de_evento_futuro = build(:inscricao, evento: evento_futuro, participou: false)
        presenter = InscricaoPresenter.new(incricao_ausente_de_evento_futuro)

        expect(presenter.destacar_ausente?).to_not be
    end
  end
end

require 'rails_helper'

RSpec.describe TotalizadorEventoPresenter, type: :presenter do

  describe '#inscritos' do
    it 'deve ser zero quando evento não possui inscricoes' do
      evento = create(:evento, data_evento: Date.current)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.inscritos).to be == 0
    end

    it 'deve ser um quando há uma inscrição' do
      evento = create(:evento, data_evento: Date.current)
      inscricao = create(:inscricao, evento: evento)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.inscritos).to be == 1
    end
  end

  describe '#participantes' do
    it 'deve ser zero quando evento não possui inscricoes' do
      evento = create(:evento, data_evento: Date.current)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.participantes).to be == 0
    end

    it 'deve ser zero quando há inscrição mas não é participante' do
      evento = create(:evento, data_evento: Date.current)
      inscricao = create(:inscricao, evento: evento, participou: false)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.participantes).to be == 0
    end

    it 'deve ser um quando há uma inscrição e é participante' do
      evento = create(:evento, data_evento: Date.current)
      inscricao = create(:inscricao, evento: evento, participou: true)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.participantes).to be == 1
    end
  end

  describe '#percentual_de_participacao' do
    it 'deve ser zero quando evento não possui inscricoes' do
      evento = create(:evento, data_evento: Date.current)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.percentual_de_participacao).to be == 0
    end

    it 'deve ser 100 quando há uma inscrição participante' do
      evento = create(:evento, data_evento: Date.current)
      inscricao = create(:inscricao, evento: evento, participou: true)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.percentual_de_participacao).to be == 100
    end

    it 'deve ser 50 quando há duas inscrições e somente uma participante' do
      evento = create(:evento, data_evento: Date.current)
      inscricao1 = create(:inscricao, evento: evento, participou: false)
      inscricao2 = create(:inscricao, evento: evento, participou: true)
      presenter = TotalizadorEventoPresenter.new(evento)
      expect(presenter.percentual_de_participacao).to be == 50
    end
  end

end

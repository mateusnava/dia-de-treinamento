require 'rails_helper'

RSpec.describe Evento do
  describe '#to_s' do
    it 'deve retornar a descrição do evento formatada' do
      evento = build(:evento, nome: 'Nome do Evento', data_evento: '20/03/1989'.to_date)

      result = evento.to_s

      expect(result).to eq('20/03/1989 - Nome do Evento')
    end
  end

  describe '.anteriores' do
    context 'quando não tiverem eventos' do
      it 'deve retornar vazio' do
        expect(Evento.anteriores).to be_empty
      end
    end

    context 'quando tiverem eventos' do
      it 'deve retornar todos eventos menos o último' do
        ultimo = create(:evento, data_evento: Date.current)
        anteriores = [create(:evento, data_evento: Date.current - 1)]

        result = Evento.anteriores

        expect(result).to eq(anteriores)
      end
    end

  end

  describe '.ultimo' do
    context 'quando não tiverem eventos' do
      it 'deve retornar vazio' do
        expect(Evento.ultimo).to be_nil
      end
    end

    context 'quando tiverem eventos' do
      it 'deve retornar o último' do
        ultimo = create(:evento, data_evento: Date.current)
        anteriores = [create(:evento, data_evento: Date.current - 1)]

        result = Evento.ultimo

        expect(result).to eq(ultimo)
      end
    end

  end
end

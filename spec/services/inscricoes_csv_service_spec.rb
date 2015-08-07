require 'rails_helper'

RSpec.describe InscricoesCsvService, type: :service do
  context '#gerar' do
    context 'quando tiver inscricoes' do
      it 'deve gerar string com campos separados com ;' do
        inscricao = create(:inscricao)

        service = InscricoesCsvService.new(Inscricao.all)

        expected = "#{inscricao.pessoa.nome};#{inscricao.pessoa.email};#{inscricao.pessoa.empresa};#{inscricao.pessoa.instituicao};false"
        expect(service.gerar.strip).to eq(expected)
      end
    end

    context 'quando não tiver inscricoes' do
      it 'deve gerar string em branco' do
        service = InscricoesCsvService.new(Inscricao.all)

        expect(service.gerar).to be_empty
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Inscricao, type: :model do
  describe '.participantes' do
    context 'deve retornar inscritos que participaram do evento' do
      let(:participante) { create(:pessoa) }
      let(:nao_participante) { create(:pessoa) }
      let!(:inscricao_1) { create(:inscricao, pessoa: participante, participou: true) }
      let!(:inscricao_2) { create(:inscricao, pessoa: nao_participante, participou: false) }

      it { expect(Inscricao.participantes.pluck(:pessoa_id)).to eq([participante.id]) }
    end
  end
end
require 'rails_helper'

RSpec.describe Inscricao, type: :model do
  describe '.participantes' do
    context 'deve retornar inscritos que participaram do evento' do
      let(:participante) { create(:pessoa) }
      let(:nao_participante) { create(:pessoa) }
      let!(:inscricao_1) { create(:inscricao_participante, pessoa: participante) }
      let!(:inscricao_2) { create(:inscricao_nao_participante, pessoa: nao_participante) }

      it { expect(Inscricao.participantes.pluck(:pessoa_id)).to eq([participante.id]) }
    end
  end

  describe 'deve setar participou como false por padrão' do
    context 'quando nil' do
      it { expect(create(:inscricao, participou: nil).participou).to_not be }
    end

    context 'quando não nil' do
      it { expect(create(:inscricao_participante).participou).to be }
      it { expect(create(:inscricao_nao_participante).participou).to_not be }
    end
  end
end
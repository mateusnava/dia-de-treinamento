require 'rails_helper'

RSpec.describe Login, :type => :model do
   describe '#ultimos' do
    context 'deve retornar últimos acessos por usuario' do
      let(:usuario_um) {create(:usuario, email: 'usuario_um@diadetreinamento.com.br')}
      let(:usuario_dois) {create(:usuario, email: 'usuario_dois@diadetreinamento.com.br')}

      let!(:login1) { create(:login, usuario: usuario_um) }
      let!(:login2) { create(:login, usuario: usuario_um) }
      let!(:login3) { create(:login, usuario: usuario_dois) }
      it { expect(Login.ultimos.length).to eq(2) }
    end
   end
end


require 'rails_helper'

feature "visualizando inscrições" do
  let!(:usuario) {FactoryGirl.create(:usuario)}

  let(:evento_passado) {FactoryGirl.create(:evento, data_evento: Date.current - 1.day)}
  FactoryGirl.create(:inscricao_nao_participante, evento: evento_passado)
  FactoryGirl.create(:inscricao_participante, evento: evento_passado)

  let(:evento_futuro) {FactoryGirl.create(:evento, data_evento: Date.current + 1.day)}
  FactoryGirl.create(:inscricao_nao_participante, evento: evento_futuro)
  FactoryGirl.create(:inscricao_participante, evento: evento_futuro)

begin
  before {
    sign_up_in_with usuario.email, usuario.password
  }
end

  scenario "ao visitar evento passado deve visualizar ausentes" do
    visit inscricoes_path
    select evento_passado.nome, from: 'Evento'
    expect(page).to have_css(".inscricao-ausente")
  end

  scenario "ao visitar evento evento futuro não deve visualizar ausentes" do
    visit inscricoes_path
    select evento_futuro.nome, from: 'Evento'
    expect(page).to_not have_css(".inscricao-ausente")
  end
end

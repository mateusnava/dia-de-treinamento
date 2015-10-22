require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  describe 'validar nome completo' do
    context 'quando não for nome completo' do
      it 'deve ocorrer erro' do
        expect(build(:pessoa, nome: 'NomeNaoCompleto')).to_not be_valid
        expect(build(:pessoa, nome: '')).to_not be_valid
        expect(build(:pessoa, nome: nil)).to_not be_valid
      end
    end

    context 'quando for nome completo' do
      it 'não deve ocorrer erro' do
        expect(build(:pessoa, nome: 'Nome Completo')).to be_valid
        expect(build(:pessoa, nome: 'Nome Super Completo')).to be_valid
        expect(build(:pessoa, nome: 'Martin Luther King, Jr.')).to be_valid
        expect(build(:pessoa, nome: 'Mathias d\'Arras')).to be_valid
        expect(build(:pessoa, nome: 'Martin king, Jr.-')).to be_valid
      end
    end
  end

  describe 'validar e-mail' do
    context 'quando não for e-mail válido' do
      it 'deve ocorrer erro' do
        expect(build(:pessoa, email: 'teste@')).to_not be_valid
        expect(build(:pessoa, email: 'teste@asd')).to_not be_valid
        expect(build(:pessoa, email: '@asd.com')).to_not be_valid
        expect(build(:pessoa, email: '')).to_not be_valid
        expect(build(:pessoa, email: nil)).to_not be_valid
      end
    end

    context 'quando for nome completo' do
      it 'não deve ocorrer erro' do
        expect(build(:pessoa, email: 'teste@teste.com')).to be_valid
        expect(build(:pessoa, email: 'teste@teste.com.br')).to be_valid
        expect(build(:pessoa, email: 'teste.teste@teste.com')).to be_valid
      end
    end
  end
end
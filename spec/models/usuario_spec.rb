require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { expect(subject).to validate_presence_of(:nome) }
  it { expect(subject).to validate_presence_of(:email) }
  it { expect(subject).to validate_presence_of(:password) }

  it { expect(subject).to validate_uniqueness_of(:email) }

  context '#valid_password?' do
    let(:usuario){  build(:usuario, password: 'senha_teste') }

    context 'quando senha válida' do
      it { expect(usuario.valid_password?('senha_teste')).to be }
    end

    context 'quando senha inválida' do
      it { expect(usuario.valid_password?('senha_invalida')).to_not be }
    end
  end
end
require 'rails_helper'

RSpec.describe InscricaoController, :type => :controller do

  describe "GET cadastrar" do
    it "returns http success" do
      get :cadastrar
      expect(response).to have_http_status(:success)
    end
  end

end

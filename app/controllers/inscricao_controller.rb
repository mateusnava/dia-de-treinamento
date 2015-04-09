class InscricaoController < ApplicationController
  def cadastrar
    InscricaoMailer.inscrever(params[:inscricao]).deliver
  end
end

class InscricaoController < ApplicationController
  def cadastrar
    InscricaoMailer.inscrever(params[:inscricao])
  end


end

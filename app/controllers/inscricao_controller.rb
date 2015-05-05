class InscricaoController < ApplicationController
  def create

    pessoa = Pessoa.create inscricao_params

    evento = Evento.last

    inscricao = Inscricao.new pessoa: pessoa, evento: evento

    if inscricao.save
      InscricaoMailer.inscrever(params[:inscricao]).deliver
      render nothing: true
    else
      render json: inscricao.errors, status: :bad_request
    end

  end

  private

  def inscricao_params
    params.require(:inscricao).permit(:nome, :email, :empresa, :instituicao)
  end

end

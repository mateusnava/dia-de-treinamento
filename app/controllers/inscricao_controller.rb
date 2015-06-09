class InscricaoController < ApplicationController
  def create
    errors = InscricaoService.params_to_inscricao(inscricao_params)

    if errors.empty?
      InscricaoMailer.inscrever(params[:inscricao]).deliver
      render nothing: true
    else
      render json: errors, status: :bad_request
    end
  end

  private

  def inscricao_params
    params.require(:inscricao).permit(:nome, :email, :empresa, :instituicao)
  end

end

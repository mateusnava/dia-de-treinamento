class Admin::InscricoesController < Admin::BaseController
  before_action :carregar_eventos, only: [:index]
  before_action :set_evento, only: [:index, :csv, :lista_de_presencas]
  before_action :set_inscricao, only: [:update, :destroy]

  def index
    if @evento
      @inscricoes = @evento
        .inscricoes
        .includes(:pessoa)
        .order(:created_at)

      @totalizador_evento = TotalizadorEventoPresenter.new(@evento)
      @inscricoes = InscricaoPresenter.wrap(@inscricoes)
    end
  end

  def csv
    csv = InscricoesCsvService.new(@evento.inscricoes).gerar
    send_data csv, type: 'text/csv', filename: 'inscricoes.csv'
  end

  def update
    if @inscricao.update(inscricao_params)
      redirect_to inscricoes_path(evento_id: @inscricao.evento_id), notice: 'Inscrição atualizada.'
    else
      redirect_to inscricoes_path(evento_id: @inscricao.evento_id), alert: 'Falha ao atualizar inscrição.'
    end
  end

  def destroy
    evento_id = @inscricao.evento_id

    if @inscricao.destroy
      redirect_to inscricoes_path(evento_id: evento_id), notice: 'Inscrição excluida com sucesso.'
    else
      redirect_to inscricoes_path(evento_id: evento_id), alert: 'Falha ao excluir inscrição.'
    end
  end

  def lista_de_presencas
      @inscricoes = @evento
        .inscricoes
        .includes(:pessoa)
        .order('pessoas.nome ASC')

    render layout: 'impressao'
  end

  private

  def carregar_eventos
    @eventos = Evento.order(:data_evento)
  end

  def set_evento
    @evento = Evento.find(params[:evento_id]) if params[:evento_id].present?
  end

  def set_inscricao
    @inscricao = Inscricao.find(params[:id])
  end

  def inscricao_params
    params.require(:inscricao).permit(:participou)
  end
end

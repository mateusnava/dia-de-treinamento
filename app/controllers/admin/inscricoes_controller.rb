class Admin::InscricoesController < Admin::BaseController
  before_action :carregar_eventos, only: [:index]
  before_action :set_evento, only: [:index]

  def index
    if @evento
      @inscricoes = @evento
        .inscricoes
        .includes(:pessoa)
        .order(:created_at)

      @total_participantes = @evento.inscricoes.participantes.count
    end
  end

  private

  def carregar_eventos
    @eventos = Evento.order(:created_at)
  end

  def set_evento
    @evento = Evento.find(params[:evento_id]) if params[:evento_id].present?
  end
end

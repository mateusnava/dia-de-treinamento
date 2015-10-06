class EventosController < ApplicationController
  before_action :set_evento

  def index
    render @evento.slug
  end

  def show
    render @evento.slug
  end

  private

  def set_evento
    if params[:id]
      @evento = Evento.friendly.find(params[:id])
    else
      @evento = Evento.ultimo
    end
  end
end

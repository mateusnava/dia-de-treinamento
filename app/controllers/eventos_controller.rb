class EventosController < ApplicationController

  def cleancode
  end

  def desenvolvimento_mobile
    @evento = Evento.last
  end

end

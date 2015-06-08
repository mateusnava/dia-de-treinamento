class EventosController < ApplicationController

  def cleancode
  end

  def desenvolvimento_mobile
    @evento = Evento.find(1)
  end

  def http_ux
    @evento = Evento.find(2)
  end

end

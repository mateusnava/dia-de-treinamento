class EventosController < ApplicationController

  def cleancode
  end

  def desenvolvimento_mobile
    @evento = Evento.find(1)
  end

  def http_ux
    @evento = Evento.find(2)
  end

  def realidade_aumentada_e_realidade_virtual
    @evento = Evento.find(3)
  end

end

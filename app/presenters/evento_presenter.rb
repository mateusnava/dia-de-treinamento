class EventoPresenter < SimpleDelegator
  def percentual_ocupacao
    self.inscricoes.length * 100 / self.vagas
  end

  def lotado?
    self.inscricoes.length >= self.vagas
  end
end
class InscricaoPresenter < SimpleDelegator

  def exibir_participou?
    self.evento.encerrado?
  end

  def self.wrap(inscricoes)
    inscricoes.collect{ |inscricao| new inscricao }
  end

  def destacar_ausente?
    self.evento.encerrado? && !self.participou?
  end

end
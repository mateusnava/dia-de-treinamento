class InscricaoPresenter < SimpleDelegator

  def exibir_participou?
    self.evento.encerrado?
  end

  def self.wrap(inscricoes)
    inscricoes.collect{ |inscricao| new inscricao }
  end

end
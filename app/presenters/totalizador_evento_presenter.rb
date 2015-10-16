class TotalizadorEventoPresenter < SimpleDelegator

  def inscritos
    self.inscricoes.length
  end

  def participantes
    self.inscricoes.participantes.count
  end

  def percentual_de_participacao
    total_inscritos = inscritos > 0 ? inscritos : 1
    (participantes * 100 / total_inscritos).round
  end
end

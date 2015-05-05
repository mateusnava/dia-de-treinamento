class Inscricao < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :evento

  validate :pessoa_no_evento

  def pessoa_no_evento
    errors.add(:base, "Ops! Você já está inscrito neste evento. Obrigado pela participação.") if Inscricao.where(pessoa_id: self.pessoa_id, evento_id: self.evento_id).exists?
  end

end

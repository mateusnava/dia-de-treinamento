class Evento < ActiveRecord::Base
  validates_presence_of :nome

  def quantidade_inscritos
    return Inscricao.where(evento_id: self.id).count
  end
end
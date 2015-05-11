class Evento < ActiveRecord::Base
  validates_presence_of :nome
  has_many :inscricoes
end
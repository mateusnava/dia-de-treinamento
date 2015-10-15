class Evento < ActiveRecord::Base
  extend FriendlyId

  validates :nome, :data_evento, presence: true
  has_many :inscricoes

  friendly_id :nome, use: :slugged

  def self.anteriores
    Evento.where.not(id: ultimo.try(:id)).order(data_evento: :desc)
  end

  def self.ultimo
    Evento.order(:data_evento).last
  end

  def to_s
    "#{data_evento.try(:to_s_br)} - #{nome}"
  end

  def encerrado?
    Date.current >= self.data_evento
  end
end
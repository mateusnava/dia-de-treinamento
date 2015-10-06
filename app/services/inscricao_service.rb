class InscricaoService
  def self.params_to_inscricao(params)
    errors = {}

    Inscricao.transaction do
      pessoa = Pessoa.find_or_initialize_by(email: params[:email])
      pessoa.assign_attributes(params)
      errors.merge!(pessoa.errors.messages) if pessoa.invalid?
      pessoa.save!

      inscricao = Inscricao.new(pessoa: pessoa, evento: Evento.ultimo)
      errors.merge!(inscricao.errors.messages) if inscricao.invalid?
      inscricao.save!

      raise ActiveRecord::Rollback, "Call tech support!" if errors.any?
    end

    errors
  rescue  StandardError => exception
    errors
  end
end
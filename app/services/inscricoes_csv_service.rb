require 'csv'

class InscricoesCsvService
  def initialize(relation)
    @relation = relation
  end

  def gerar
    inscricoes = @relation.joins(:pessoa).includes(:pessoa).order('pessoas.nome')
    CSV.generate(col_sep: ';') do |csv|
      inscricoes.each do |inscricao|
        csv << [
          inscricao.pessoa.nome,
          inscricao.pessoa.email,
          inscricao.pessoa.empresa,
          inscricao.pessoa.instituicao,
          inscricao.participou
        ]
      end
    end
  end
end
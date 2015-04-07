class InscricaoMailer < ActionMailer::Base
  default from: "contato@inocode.com.br"

  def inscrever(inscricao)
    @inscricao = inscricao
    mail({
      to: "#{inscricao['email']}",
      bcc: ['Dia de Treinamento <contato@inocode.com.br>'],
      subject: "Inscrição Dia de Treinamento"
    })
  end

end

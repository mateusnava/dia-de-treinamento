class Pessoa < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  NOME_COMPLETO_REGEX = /([a-zA-Z]*\s)+/

  validates :nome, :email, presence: true
  validates :email, uniqueness: true
  validates :nome, format: { with: NOME_COMPLETO_REGEX, message: I18n.t('errors.messages.full_name') }
  validates :email, format: { with: EMAIL_REGEXP, message: I18n.t('errors.messages.email') }
end
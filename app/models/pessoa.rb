class Pessoa < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates :nome, :email, presence: true
  validates :email, uniqueness: true
  validates :nome, format: { with: /([a-zA-Z]*\s)+/, message: I18n.t('errors.messages.full_name') }
  validates :email, format: { with: EMAIL_REGEXP, message: I18n.t('errors.messages.email') }
end
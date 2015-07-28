class Usuario < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
          :rememberable, :trackable, :validatable

  validates :nome, presence: true
end
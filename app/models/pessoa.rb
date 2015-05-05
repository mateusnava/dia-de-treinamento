class Pessoa < ActiveRecord::Base

  validates :nome, :email, presence: true
  validates :email, uniqueness: true

  def inscrever
    
  end

end

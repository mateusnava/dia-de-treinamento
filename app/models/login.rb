class Login < ActiveRecord::Base
  belongs_to :usuario

  scope :ultimos, -> { order('created_at DESC').limit(10).group('usuario_id') }
end

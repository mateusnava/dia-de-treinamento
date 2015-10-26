Warden::Manager.after_set_user :except => :fetch do |record, warden, options|
  Login.create(usuario_id: record.id, ip: warden.request.ip, data: Time.current)
end

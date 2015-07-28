if Usuario.count.zero?
  puts 'Criando usuário'
  Usuario.create! nome: 'Usuário', email: 'teste@teste.com.br', password: 'connect123'
end
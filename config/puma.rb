# config/puma.rb
workers 1
threads 1, 1

bind "unix://tmp/sockets/puma-dia-treinamento.sock"

pidfile "tmp/puma/pid"
state_path "tmp/puma/state"
activate_control_app

environment ENV['RAILS_ENV'] || 'production'
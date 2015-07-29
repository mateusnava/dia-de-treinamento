# config/puma.rb
workers 1
threads 1, 1
preload_app!

bind "unix://tmp/sockets/puma-dia-treinamento.sock"

pidfile "tmp/puma/pid"
state_path "tmp/puma/state"
activate_control_app

daemonize true

environment ENV['RAILS_ENV'] || 'production'
#!/bin/bash -e

echo "############################################################################################################"
echo "################################ DDT Publicando no Ambiente de Produção ####################################"
echo "############################################################################################################"

source /etc/profile

if [ "$USER" != "diadetreinamento" ]; then
  echo 'Você deve rodar este script com o usuário wolf'
  exit 1
fi

cd /home/diadetreinamento/dia-de-treinamento-new
mkdir -p tmp/puma
mkdir -p tmp/sockets

chmod 777 -R public/assets

echo 'Atualizando arquivos via GIT do repositório'
git pull -r origin master

echo 'Executando Bundle'
bundle -V

echo 'Rodando db:migrate'
RAILS_ENV=production bundle exec rake db:migrate

echo 'Reiniciando Puma'
bundle exec pumactl -F config/puma.rb phased-restart

echo "############################################################################################################"
echo "###################################### DDT Publicado Com Sucesso \o/ #######################################"
echo "############################################################################################################"
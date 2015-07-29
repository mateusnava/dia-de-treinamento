#!/bin/bash -e

export PROJECT_FOLDER=/home/diadetreinamento/dia-de-treinamento-new
export DEPLOY=rails1-diadetreinamento
export SERVER="puma"

grep -q "Host rails1-administrador$" ~/.ssh/config || cat <<EOF >> ~/.ssh/config

Host rails1-administrador
Hostname 107.170.30.113
User administrador
Port 2222
IdentityFile ~/.inocode_keys/key_administrador
EOF

grep -q "Host $DEPLOY$" ~/.ssh/config || cat <<EOF >> ~/.ssh/config

Host $DEPLOY
Hostname 107.170.30.113
User diadetreinamento
Port 2222
IdentityFile ~/.inocode_keys/key_deploy
EOF


function deploy {
  if [[ $(git status --short) ]]; then
    echo "Existem arquivos que não estão 'comitados', resolva isso antes de prosseguir com o deploy"
    exit 1
  fi

  echo "Gerando e enviando assets"
  RAILS_ENV=production bundle exec rake assets:precompile
  RAILS_ENV=production bundle exec rake assets:clean
  rsync -av --delete public/assets/ $DEPLOY:$PROJECT_FOLDER/public/assets/

  scp deploy.sh $DEPLOY:

  ssh $DEPLOY "chmod +x deploy.sh && ./deploy.sh"
}

function administrar {
  ssh rails1-administrador
}

function conectar {
  ssh $DEPLOY
}

function console {
  ssh -t $DEPLOY bash -c "'
    source /etc/profile
    cd $PROJECT_FOLDER
    RAILS_ENV=production bundle exec rails c
  '"
}

function logs {
  ssh -t $DEPLOY bash -c "'
    source /etc/profile
    cd $PROJECT_FOLDER
    tail -f log/*.log
  '"
}

echo "############## Dia de Treinamento ##############"
options=("Deploy" "SSH" "Administrar" "Console Rails" "Visualizar Logs" "Sair")
select opt in "${options[@]}"
do
  case $opt in
    "Deploy")
      deploy
      break
      ;;
    "SSH")
      conectar
      break
      ;;
    "Administrar")
      administrar
      break
      ;;
    "Console Rails")
      console
      break
      ;;
    "Visualizar Logs")
      logs
      break
      ;;
    "Sair")
      break
      ;;
    *) echo "Opção Inválida";;
  esac
done
#/bin/bash

echo "Adicionando variável NEEDRESTART_MODE para"
echo "automaticamente reiniciar serviços"
export NEEDRESTART_MODE=a

echo "Atualizando sistema"
apt-get update -y
apt-get upgrade -y

echo "Instalando pacotes"
apt-get install apache2 unzip -y

echo "Baixando arquivos do site"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

echo "Removendo pacote que não será mais utilizado"
apt-get remove unzip -y

echo "Configurando site"
cd /var/www/html
rm index.html
cp -r /tmp/linux-site-dio-main/* .


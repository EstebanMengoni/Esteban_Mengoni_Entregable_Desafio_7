#!/bin/bash

sudo apt install curl
sudo apt install git

echo -e "\nElija una opcion\n0. Salir\n1. Clonar repositorio privado\n2. Clonar todos los repositorios de un usuario"

read opcion

while [ $opcion != "0"  ]
do 
if [ $opcion == "1" ]
  then
    read -p "Ingrese el usuario del cual quiere copiar el repositorio. " usuario
  
    read -p "Ingrese el TOKEN del usuario. " token
  
    read -p "Ingrese el nombre del repositorio a copiar. " repo
  
    git clone https://$token@github.com/$usuario/$repo
fi

if [ $opcion == "2" ]
then
  read -p "Ingrese el usuario del cual quiere copiar todos sus repositorios. " user

  curl -s https://api.github.com/users/$user/repos | grep \"clone_url\" | awk '{print$2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
fi

echo -e "\nElija una opcion\n0. Salir\n1. Clonar repositorio privado\n2. Clonar todos los repositorios de un usuario"

read opcion

done
#!/bin/bash

read -p "Desea clonar un repositorio privado? (y/n)" sino

while [ $sino != "n"  ]
do 
  read -p "Ingrese el usuario del cual quiere copiar el repositorio" usuario
  
  read -p "Ingrese el TOKEN del usuario" token
  
  read -p "Ingrese el nombre del repositorio a copiar" repo
  
  git clone https://$token@github.com/$usuario/$repo
  
  read -p "Desea clonar otro repositorio privado (y/n)" sino
done

read -p "Ingrese el usuario del cual quiere copiar todos sus repositorios" $user

curl -s https://api.github.com/users/$user/repos? | grep \"clone_url\" | awk {print$2} | sed -e 's/"//g' -e 's/"//g' | xargs -n1 git clone

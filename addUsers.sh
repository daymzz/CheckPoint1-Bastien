#!/bin/bash

create_user () {
# Répétition de la création jusqu'au dernier argument
while [ $# -ne "0" ]
do
        # Vérification de l'existence de l'utilisateur. Si il n'existe pas, il sera créer
        id -u $1 > /dev/null
        if [ $? = "1" ]
        then
                sudo adduser $1 && echo "L'utilisateur $1 a été créer avec succès."
        else
                echo " L'utilisateur $1 existe déjà, échec de la création."
        fi
        #Ce truc est un cheat code
        shift
done
}
# Vérification de la présence d'argument de script
if [ $# -lt "1" ]
then
        # Si il n'y a pas d'arguments, fin du script
        echo "Il manque les noms d'utilisateur en argument - Fin du script"
        exit
else
        # Si il y a au moins 1 argument, la création commence
        echo "Les utilisateurs suivants seront créer : $* "
        create_user $*
fi


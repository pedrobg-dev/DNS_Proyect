#!/bin/bash

exec 2>> ./err.log
while IFS= read -r linea
do
	usuario=$(echo "$linea" | cut -f1 -d:)
	contrasena=$(echo "$linea" | cut -f2 -d:)
	uid=$(echo "$linea" | cut -f3 -d:)
	gid=$(echo "$linea" | cut -f4 -d:)
	gecos=$(echo "$linea" | cut -f5 -d:)
	home=$(echo "$linea" | cut -f6 -d:)
	shell=$(echo "$linea" | cut -f7 -d:)
	getent passwd $usuario > /dev/null
	if [[ $? -ne 0 ]];
	then 
		getent group $gid > /dev/null
		if [[ $? -eq 0 ]];
		then
			contrasena=$(openssl passwd -6 -salt gromenauer "$contrasena")
			sudo useradd -u "$uid" -g "$gid" -c "$gecos" -d "$home" -s "$shell" $usuario
			sudo usermod -p $contrasena $usuario
		else
			2> echo "El grupo no existe."
		fi
	else
		2> echo "El usuario ya existe."
	fi
done < $1

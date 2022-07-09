#/bin/sh

#Bakup DNS

#¿De qué queremos hacer el Backup?
backup_files="/etc/named/zones/db.planecarios15.cf"
#¿Donde lo vamos a almacenar?
dest="/srv/backup/dns"
#Crear el nombre del archivo
fecha=$(date+"$A_%d_%B_%T")
hostname=$(hostname -s)
archive_file="$hostname-$fecha-respaldo.db.planbecarios15.cf"
#Mostramos por consola que ha comenzado el Backup y la fecha
echo "Backing up $backup_files to $dest/archive_file"
#Mostramos por consola el final del Backup y la fecha
echo "Backup finished"
echo $(date)

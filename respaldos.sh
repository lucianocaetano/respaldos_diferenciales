# !/bin/bash

now=$(date +%Y-%m-%d)

dest=false

origin="mauro@10.211.117.86:/home/mauro/origen/"
destino="/home/mauro/destino"

makeFull() {
	rsync -avh --delete "$origin" "$destino/full"
}

if ls /home/mauro/destino/full/ > /dev/null 2>&1; then
	rsync -avh --delete --link-dest=/home/mauro/destino/full "$origin" "$destino/$now"
else 
	makeFull
fi

#! bin/sh

dirs=$(find ~/ -name .Trash -prune -o \( -name docker-compose.yml -exec dirname {} \; \) )

for d in $dirs
do
	if [ -d "$d" ]; then
	  ( cd $d && docker-compose down )
	fi
done
#! bin/sh
#find ~/ -iname docker-compose.yml

#find ~/ -name .Trash -prune -o \( -iname docker-compose.yml -type d \)

#dirs=($(find ~/ -name .Trash -prune -o \( -iname docker-compose.yml -type d \)))
#for dir in "${dirs[@]}"; do
#  cd "$dir"
#  PWD=pwd
#  echo $PWD
#done

# Working for finding dirs
#find ~/ -name .Trash -prune -o \( -name docker-compose.yml \) -exec dirname {} \;
dirs=$(find ~/Sites -name .Trash -prune -o \( -name docker-compose.yml -exec dirname {} \; \) )

for d in $dirs
do
	if [ -d "$d" ]; then
	  ( cd $d && docker-compose down )
	fi
done

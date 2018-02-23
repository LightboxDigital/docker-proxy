Configure host files:

##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1          localhost

0.0.0.0 my.site.one
0.0.0.0 my.site.two

Create a new network

$ docker network create nginx-proxy

Set up environment:

1. Copy nginx-proxy directory to your www root for all sites (~/Sites - perhaps?)
2. Modify line 11 of docker-compose.yml to match your directory structure (- ~/sites/:/var/www/ possibly?)
3. Copy the docker-compose.yml and docker directory from either site-1 or site-2 directory.
4. Modify the following lines in the docker-compose.yml file to match you environment:
	- 9
	- 11 
	- 12 
	- 13 
	- 14
	- 24 
	- 25 

Note: Lines 13 & 25 must match, this will map the fastcgi param to the correct php container.

Notice the command parameter will replace the variables accordingly when the container spins up, mapping your services correctly and allowing the proxy to forward requests correctly.

You can modify the PHP version as you see fit by adjusting ./docker/php/Dockerfile.  You can also install additional items to the Nginx container by modifying ./docker/nginx/Dockerfile.

Happy Dockering ;)

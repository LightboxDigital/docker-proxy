![Docker Logo](https://msdnshared.blob.core.windows.net/media/2017/10/docker.png "Docker Logo")


Docker Proxy
============

Allowing for multiple projects to run side by side on your local machine.  

Credits to [jwilder proxy](https://github.com/jwilder/nginx-proxy)

## Instructions for setup

Configure host files, add domains to your hosts files (/etc/hosts) like below, you can add as many as required:

- 0.0.0.0 my.site.one
- 0.0.0.0 my.site.two

Docker proxy is network specific, meaning you can have as many network proxys as you require, all operating independently from each other. To create a new network use the following command:

<pre>
$ docker network create nginx-proxy
</pre>

Set up environment:

- Copy nginx-proxy directory to your **www root** for all your sites (~/Sites perhaps?).
- Modify line 11 of docker-compose.yml to match your directory structure (- ~/sites/:/var/www/ possibly)?
- Copy the docker-compose.yml and docker directory from either site-1 or site-2 directory.
- Modify the following lines in the docker-compose.yml file to match you environment:
	- 9
	- 11 
	- 12 
	- 13 
	- 14
	- 24 
	- 25 

Note: Lines 13 & 25 _must match_, this will map the fastcgi param to the correct php container, this is very important.

Notice the <code>command</code> parameter will replace the variables accordingly when the container spins up, mapping your services correctly and allowing the proxy to forward requests correctly.

You can modify the PHP version as you see fit by adjusting _./docker/php/Dockerfile_.  You can also install additional items to the Nginx container by modifying _./docker/nginx/Dockerfile_.

Happy Dockering ;)




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

Set up environment: (for Wordpress setup, **see below**!)

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

### Set up environment (Wordpress):
The Wordpress environment setup is slightly different, as this doesn't require the PHP-FPM container, as it's already packaged with the Wordpress image.

The lines that need changing in the **docker-compose.yml** file for for Wordpress setups are:

- **10**
- **12** (must match the container name of the 'wordpress' service on line 18).
- **13**
- **18**
- **19** (only change this if you want a newer version of Wordpress. Note we can't use wordpress:latest here because that comes packaged with Apache, which we don't want - see all PHP-FPM versions here: [docker/wordpress](https://hub.docker.com/_/wordpress/)).
- **23** (this should match the **db** 'container_name' in the nginx-proxy, unlikely to need to be changed unless you adjusted the original proxy docker-compose.yml!).
- **24/25** (these should match your local mysql username password (again, set in the original proxy docker-compose.yml). Possibly just 'root' and 'password').
- **26** (if this doesn't exist, docker will create it if it can using the above username/password).

By entering the database details on the above lines, a wp-config.php file will be automatically created using the details provided. You will then just need to run the Wordpress installation.

Happy Dockering ;)



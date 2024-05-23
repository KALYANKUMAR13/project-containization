## Environment Variable related activities

- Defining environment variable using `-e` option
```
sudo docker run --rm --name nginx -d -p 8081:80 -e BACKEND_NAME=mybackend nginx
```
- Defining environment variable using `--env-file` option
- Create file named myenv-file using the following content:
FOO=foo
BAR=bar
BACKEND=mybackend
```
sudo docker run --rm --name nginx -d -p 8081:80 --env-file myenv-file nginx
sudo docker exec -it nginx bash
```
echo $BACKEND           (run this inside the container)

## Create Wordpress stack to understand network

======= Dockerfile_wp
FROM wordpress:latest
RUN apt-get update && \
  apt-get install -y mariadb-client vim
ENV WORDPRESS_DB_HOST=db
ENV WORDPRESS_DB_USER=wordpress
ENV WORDPRESS_DB_PASSWORD=wordpress
ENV WORDPRESS_DB_NAME=wordpress
EXPOSE 80



====== Dockerfile_db
FROM mariadb:10.6.4-focal
ENV MYSQL_ROOT_PASSWORD=somewordpress
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=wordpress
EXPOSE 3306 33060

- Commands:
```
sudo docker build -t wp . -f Dockerfile_wp
sudo docker build -t db . -f Dockerfile_db
sudo docker run --rm --name wp -d -p 8081:80 wp
sudo docker run --rm --name db -d db
- You won't able to connect to DB from wordpress. Let's stop wp container and find the IP of db:
sudo docker stop wp
sudo docker inspect db
sudo docker run --rm --name wp -d -p 8081:80 -e WORDPRESS_DB_HOST=172.17.0.3 wp

### Using custom network
sudo docker stop wp db
sudo docker network create wp-net
sudo docker network list
sudo docker run --rm --name wp -d -p 8081:80 --network wp-net wp
sudo docker run --rm --name db -d --network wp-net db
```

```
- Commands for Docker compose file:
sudo docker compose -f wp-compose.yaml up -d
sudo docker network list
sudo docker ps
sudo docker compose -f wp-compose.yaml down
```

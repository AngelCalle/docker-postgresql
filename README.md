<!-- List available images. -->
docker image ls

<!-- List active containers. -->
docker ps -a

<!-- Stop container. -->
docker rm CONTAINER_ID

<!-- Get container information. -->
docker inspect CONTAINER_ID

<!-- Get container ip. -->
docker inspect -f '{{.NetworkSettings.IPAddress}}' CONTAINER_ID


# Container with local pgadmin4.
<!-- Compile container. -->
docker build . -t server-docker-postgres

<!-- Lift container. -->
docker run -it --rm -d -p 15432:5432 -e POSTGRES_USER=caramelo -e POSTGRES_PASSWORD=caramelo -e POSTGRES_DB=caramelo server-docker-postgres

<!-- Configuration add server in local pgadmin4. -->
General - name: docker
Connection - Host: 127.0.0.1
Connection - Port: 15432
Connection - Username: caramelo
Connection - Password: caramelo


# Steps to communicate two containers.
<!-- Lift postgres container. -->
docker run -it --rm -d -p 5432:5432 -e POSTGRES_PASSWORD=admin --name container-postgresdb postgres

<!-- Lift container pgadmin4. -->
docker run -it --rm -d -p 5050:80 -e "PGADMIN_DEFAULT_EMAIL=name@example.com" -e "PGADMIN_DEFAULT_PASSWORD=admin" dpage/pgadmin4
<!-- Access the pgadmin4 server. -->
<!-- http://localhost:5050 -->


# Steps to communicate IMG docker with pgadmin4.
docker run -it --rm -d -p 15432:5432 -e POSTGRES_USER=caramelo -e POSTGRES_PASSWORD=caramelo -e POSTGRES_DB=caramelo --name postgres postgres

<!-- Configuration add server in local pgadmin4. -->
General - name: docker
Connection - Host: 127.0.0.1
Connection - Port: 15432
Connection - Username: caramelo
Connection - Password: caramelo


# Steps to use docker-compose.yml.
<!-- Running container. -->
docker-compose up -d 

<!-- Knock down the container. -->
docker-compose down


<!-- Configuration add server in local pgadmin4 -->
General - name: docker
Connection - Host: 127.0.0.1
Connection - Port: 15432
Connection - Username: caramelo
Connection - Password: caramelo
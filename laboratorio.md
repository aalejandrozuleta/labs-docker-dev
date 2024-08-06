# Ouput
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
efc2b5ad9eec: Pull complete 
8fe9a55eb80f: Pull complete 
045037a63be8: Pull complete 
7111b42b4bfa: Pull complete 
3dfc528a4df9: Pull complete 
9e891cdb453b: Pull complete 
0f11e17345c5: Pull complete 
Digest: sha256:6af79ae5de407283dcea8b00d5c37ace95441fd58a8b1d2aa1ed93f5511bb18c
Status: Downloaded newer image for nginx:latest

# Running our container 
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker run -d -p 8080:80 nginx
92bd60d9c276fe826e6bf6781c711ce8099ba61a5165281c105349899c12d5ff

#  Ejecuta un contenedor de Ubuntu en modo interactivo:
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker run -it ubuntu bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
9c704ecd0c69: Pull complete 
Digest: sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30
Status: Downloaded newer image for ubuntu:latest

# Eliminar
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS                                   NAMES
38801de92f5f   ubuntu    "bash"                   4 minutes ago   Exited (0) 7 seconds ago                                           affectionate_agnesi
92bd60d9c276   nginx     "/docker-entrypoint.…"   7 minutes ago   Up 7 minutes               0.0.0.0:8080->80/tcp, :::8080->80/tcp   infallible_almeida

@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker rm 38801de92f5f
38801de92f5f

@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                   NAMES
92bd60d9c276   nginx     "/docker-entrypoint.…"   9 minutes ago   Up 9 minutes   0.0.0.0:8080->80/tcp, :::8080->80/tcp   infallible_almeida
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ 


# docker build
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker build -t ubuntu-updated:latest .
[+] Building 23.9s (10/10) FINISHED                                                                  docker:default
 => [internal] load build definition from Dockerfile                                                           0.0s
 => => transferring dockerfile: 563B                                                                           0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                               0.7s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                  0.0s
 => [internal] load .dockerignore                                                                              0.1s
 => => transferring context: 2B                                                                                0.0s
 => [1/4] FROM docker.io/library/ubuntu:latest@sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc  2.2s
 => => resolve docker.io/library/ubuntu:latest@sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc  0.2s
 => => sha256:c920ba4cfca05503764b785c16b76d43c83a6df8d1ab107e7e6610000d94315c 424B / 424B                     0.0s
 => => sha256:35a88802559dd2077e584394471ddaa1a2c5bfd16893b829ea57619301eb3908 2.30kB / 2.30kB                 0.0s
 => => sha256:9c704ecd0c694c4cbdd85e589ac8d1fc3fd8f890b7f3731769a5b169eb495809 29.71MB / 29.71MB               0.5s
 => => sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30 1.13kB / 1.13kB                 0.0s
 => => extracting sha256:9c704ecd0c694c4cbdd85e589ac8d1fc3fd8f890b7f3731769a5b169eb495809                      1.1s
 => [internal] load build context                                                                              0.2s
 => => transferring context: 42.41kB                                                                           0.0s
 => [2/4] RUN apt-get update && apt-get install -y     curl     wget     vim     && apt-get clean             18.6s
 => [3/4] WORKDIR /app                                                                                         0.2s
 => [4/4] COPY . /app                                                                                          0.2s
 => exporting to image                                                                                         1.4s
 => => exporting layers                                                                                        1.3s
 => => writing image sha256:842f853d40a6e1eb28ee53616c772a9188a7954afadb550b8e5f64c0d6539a18                   0.0s
 => => naming to docker.io/library/ubuntu-updated:latest   

# CMD
# Define el comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["nginx", "-g", "daemon off;"]

# build 
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 1.5s (10/10) FINISHED                                                                   docker:default
 => [internal] load build definition from Dockerfile                                                           0.1s
 => => transferring dockerfile: 585B                                                                           0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                               0.2s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                  0.0s
 => [internal] load .dockerignore                                                                              0.0s
 => => transferring context: 2B                                                                                0.0s
 => [1/4] FROM docker.io/library/ubuntu:latest@sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc  0.0s
 => [internal] load build context                                                                              0.1s
 => => transferring context: 24.21kB                                                                           0.0s
 => CACHED [2/4] RUN apt-get update && apt-get install -y     curl     wget     vim     && apt-get clean       0.0s
 => CACHED [3/4] WORKDIR /app                                                                                  0.0s
 => [4/4] COPY . /app                                                                                          0.2s
 => exporting to image                                                                                         0.6s
 => => exporting layers                                                                                        0.5s
 => => writing image sha256:c66afaa79a260c1520e6b431d13478eb119d2cb2da41c0421c4502661a6c6357                   0.0s
 => => naming to docker.io/library/my-nginx:latest                                                             0.0s

# ejecutar

@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker run -d -p 80:80 my-nginx:latest
52bf3cd44d5b783f821a142079dd7187ecf87919cb17b01723c02d76d8a8b6ff





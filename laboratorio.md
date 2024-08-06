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

# index
@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 2.1s (9/9) FINISHED                                                                            docker:default
 => [internal] load build definition from Dockerfile                                                                  0.0s
 => => transferring dockerfile: 392B                                                                                  0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                      0.2s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                         0.0s
 => [internal] load .dockerignore                                                                                     0.0s
 => => transferring context: 2B                                                                                       0.0s
 => [1/3] FROM docker.io/library/ubuntu:latest@sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b  0.0s
 => [internal] load build context                                                                                     0.0s
 => => transferring context: 31B                                                                                      0.0s
 => CACHED [2/3] RUN apt-get update &&     apt-get install -y nginx &&     apt-get clean                              0.0s
 => [3/3] COPY index.html /usr/share/nginx/html/                                                                      0.1s
 => exporting to image                                                                                                1.2s
 => => exporting layers                                                                                               1.1s
 => => writing image sha256:dba744d561c4be2ce8895194a5f9631aae19ae95252e917a67a04bbe790a1ee8                          0.0s
 => => naming to docker.io/library/my-nginx:latest   


# myfile.txt

@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 2.2s (10/10) FINISHED                                                                          docker:default
 => [internal] load build definition from Dockerfile                                                                  0.0s
 => => transferring dockerfile: 424B                                                                                  0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                      0.2s
 => [internal] load .dockerignore                                                                                     0.0s
 => => transferring context: 2B                                                                                       0.0s
 => [1/5] FROM docker.io/library/ubuntu:latest@sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b  0.0s
 => [internal] load build context                                                                                     0.1s
 => => transferring context: 60B                                                                                      0.0s
 => CACHED [2/5] RUN apt-get update &&     apt-get install -y nginx &&     apt-get clean                              0.0s
 => CACHED [3/5] COPY index.html /usr/share/nginx/html/                                                               0.0s
 => [4/5] WORKDIR /app                                                                                                0.2s
 => [5/5] COPY myfile.txt .                                                                                           0.2s
 => exporting to image                                                                                                1.1s
 => => exporting layers                                                                                               1.0s
 => => writing image sha256:d56ca1da1651be5a921b488e69babbb6a4be6aa0f22ad57116600328712f8294                          0.0s
 => => naming to docker.io/library/my-nginx:latest    

# script.py

@aalejandrozuleta ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 25.2s (8/8) FINISHED                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                  0.0s
 => => transferring dockerfile: 111B                                                                                  0.0s
 => [internal] load metadata for docker.io/library/python:3.9                                                         0.2s
 => [internal] load .dockerignore                                                                                     0.1s
 => => transferring context: 2B                                                                                       0.0s
 => [1/3] FROM docker.io/library/python:3.9@sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db  21.9s
 => => resolve docker.io/library/python:3.9@sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db   0.1s
 => => sha256:9972540d93856f9ca3eff2cf803ffb472bf1687cd1a91365cc803a539281900b 2.52kB / 2.52kB                        0.0s
 => => sha256:ca4e5d6727252f0dbc207fbf283cb95e278bf562bda42d35ce6c919583a110a0 49.55MB / 49.55MB                      1.7s
 => => sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db 10.35kB / 10.35kB                      0.0s
 => => sha256:83a59ab1a4811d0d1b135849e5071eff4d461a56def17589bd1b2f093aeeb5a1 7.31kB / 7.31kB                        0.0s
 => => sha256:30b93c12a9c9326732b35d9e3ebe57148abe33f8fa6e25ab76867410b0ccf876 24.05MB / 24.05MB                      0.5s
 => => sha256:10d643a5fa823cd013a108b2076f4d2edf1b2a921f863b533e83ea5ed8d09bd4 64.14MB / 64.14MB                      1.0s
 => => sha256:d6dc1019d7935fe82827434da11bf96cf14e24979f8155e73b794286f10b7f05 211.24MB / 211.24MB                    3.5s
 => => sha256:c7d45ab0573c09f3315112fe3e8d273f4b54dab9e8c3f315810afb743e794a28 6.16MB / 6.16MB                        1.2s
 => => sha256:564d1c451ea70670b349d1250f5c0577416f873f6ee7b5cb33dafeb21c2c40a4 15.82MB / 15.82MB                      1.8s
 => => extracting sha256:ca4e5d6727252f0dbc207fbf283cb95e278bf562bda42d35ce6c919583a110a0                             2.5s
 => => sha256:91b87d81d4c8d2b201b71e0a5b07fe01ea4e6d1be30cdc8c30f96653b6663df3 2.70MB / 2.70MB                        2.0s
 => => sha256:ddfb50ba1977e47749619886799b60da9f2a856fca3270ccb051d2f326489bd5 233B / 233B                            2.0s
 => => extracting sha256:30b93c12a9c9326732b35d9e3ebe57148abe33f8fa6e25ab76867410b0ccf876                             0.6s
 => => extracting sha256:10d643a5fa823cd013a108b2076f4d2edf1b2a921f863b533e83ea5ed8d09bd4                             2.5s
 => => extracting sha256:d6dc1019d7935fe82827434da11bf96cf14e24979f8155e73b794286f10b7f05                             6.8s
 => => extracting sha256:c7d45ab0573c09f3315112fe3e8d273f4b54dab9e8c3f315810afb743e794a28                             0.3s
 => => extracting sha256:564d1c451ea70670b349d1250f5c0577416f873f6ee7b5cb33dafeb21c2c40a4                             0.6s
 => => extracting sha256:ddfb50ba1977e47749619886799b60da9f2a856fca3270ccb051d2f326489bd5                             0.0s
 => => extracting sha256:91b87d81d4c8d2b201b71e0a5b07fe01ea4e6d1be30cdc8c30f96653b6663df3                             0.3s
 => [internal] load build context                                                                                     0.1s
 => => transferring context: 55B                                                                                      0.0s
 => [2/3] WORKDIR /app                                                                                                0.2s
 => [3/3] COPY script.py .                                                                                            0.2s
 => exporting to image                                                                                                2.1s
 => => exporting layers                                                                                               2.0s
 => => writing image sha256:811eedaffcc6d0566f5cbb44a9aa9413943feb57a3d2ac9fb37868c47613c3a5                          0.0s
 => => naming to docker.io/library/my-nginx:latest   
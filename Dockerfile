# Usa la imagen base oficial de Ubuntu
FROM ubuntu:latest

# Actualiza los paquetes e instala nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Exponer el puerto 80
EXPOSE 80

COPY index.html /usr/share/nginx/html/

WORKDIR /app
COPY myfile.txt .

# Define el comando por defecto para ejecutar nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
# Usa la imagen base oficial de Ubuntu
FROM ubuntu:latest

# Actualiza los paquetes e instala nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Exponer el puerto 80
EXPOSE 80

# Define el comando por defecto para ejecutar nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
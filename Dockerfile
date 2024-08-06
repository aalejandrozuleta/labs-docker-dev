# Usa la imagen base oficial de Ubuntu
FROM ubuntu:latest

# Establece el mantenedor de la imagen
LABEL maintainer="jhoitan266@gmail.com"

# Actualiza los paquetes e instala algunas herramientas básicas
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    && apt-get clean

# Establece el directorio de trabajo
WORKDIR /app

# Copia el contenido local al directorio de trabajo en el contenedor
COPY . /app

# Define el comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["nginx", "-g", "daemon off;"]

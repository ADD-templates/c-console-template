FROM ubuntu:22.04

# Evitar interacción en la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y build-essential gcc make valgrind git && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario no root para desarrollo
RUN useradd -ms /bin/bash devuser
USER devuser
WORKDIR /home/devuser/app

# Copiar el proyecto al contenedor
COPY . .

# Crear estructura de directorios por si no existe
RUN make dirs

# Entrar en bash por defecto
CMD ["/bin/bash"]

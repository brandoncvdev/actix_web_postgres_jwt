# FROM ubuntu:22.04
# RUN apt-get update && apt-get install curl pkg-config libssl-dev build-essential libpq-dev -y
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# ENV PATH="/root/.cargo/bin:${PATH}"

# WORKDIR /app
# COPY ["./Cargo.lock", "./Cargo.toml", "./"]
# RUN cargo build --release


# FROM ubuntu:22.04
# RUN apt-get update && apt-get install curl pkg-config libssl-dev build-essential libpq-dev -y
# WORKDIR /app

# COPY --from=0 /app/target/release/actix_web_jwt /app
# COPY --from=0 /templates /app/templates
# CMD ["./actix_web_jwt"]




# Utiliza la imagen oficial de Rust como base
FROM rust:latest

# Crea un directorio de trabajo para tu aplicación
WORKDIR /app

# Copia el archivo Cargo.toml y el archivo Cargo.lock para descargar las dependencias de manera más eficiente
COPY ["./Cargo.toml", "./"]

# Copia todo el código fuente de tu aplicación
COPY src ./src

# Compila la aplicación
RUN cargo build --release

# Expone el puerto en el que tu aplicación Actix Web escucha
EXPOSE 8000

# Comando para ejecutar tu aplicación cuando el contenedor se inicie
CMD ["./target/release/actix_web_jwt"]
# --- ETAPA 1: CONSTRUCCIÓN (EL COCINERO) ---
# Usamos una imagen de Maven para compilar tu código
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copiamos todos tus archivos al entorno de construcción
COPY . .

# Ejecutamos Maven para crear el archivo .war (saltando los tests para ir rápido)
RUN mvn clean package -DskipTests

# --- ETAPA 2: EJECUCIÓN (EL MESERO) ---
# Usamos Tomcat 10 (compatible con Jakarta) para servir la app
FROM tomcat:10.1-jdk17

# Borramos la aplicación por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# COPIAMOS el archivo que "cocinamos" en la Etapa 1 a la carpeta de Tomcat
# Aquí es donde fallaba antes, ahora sí lo encontrará porque lo creamos arriba
COPY --from=build /app/target/app.war /usr/local/tomcat/webapps/ROOT.war

# Abrimos el puerto y arrancamos
EXPOSE 8080
CMD ["catalina.sh", "run"]

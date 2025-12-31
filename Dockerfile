# Usamos Tomcat 10 que es compatible con Jakarta
FROM tomcat:10.1-jdk17

# Borramos la app por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiamos tu app compilada al servidor
COPY target/app.war /usr/local/tomcat/webapps/ROOT.war

# Abrimos el puerto
EXPOSE 8081
CMD ["catalina.sh", "run"]

FROM openjdk:8-jre
EXPOSE 8080
VOLUME /tmp
COPY target/spring-petclinic-1.5.1.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

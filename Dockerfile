FROM openjdk:17-jdk-alpine
VOLUME /tmp
COPY target/githubdemo-app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
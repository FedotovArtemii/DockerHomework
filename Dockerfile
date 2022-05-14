FROM docker
COPY --from=docker/buildx-bin:latest /buildx /usr/libexec/docker/cli-plugins/docker-buildx
ARG BUILD_DATE
ARG BUILD_COMMIT

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.build-commit=$BUILD_COMMIT

#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
ARG VERSION
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package -DskipTests -Dversion=${VERSION}

FROM openjdk
ARG VERSION
COPY --from=build /home/app/target/ToDo-${VERSION}.jar /usr/local/lib/ToDo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/ToDo.jar"]


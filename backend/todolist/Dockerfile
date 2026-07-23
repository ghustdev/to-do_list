FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /todolist
COPY . .
RUN chmod +x gradlew
RUN ./gradlew bootJar --no-daemon

FROM eclipse-temurin:21-jre-alpine
WORKDIR /todolist
COPY --from=build /todolist/build/libs/*.jar todolist.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "todolist.jar"]
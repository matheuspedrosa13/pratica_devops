FROM maven:3.8.3-openjdk-17 AS BUILD
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=BUILD /app/target/JBS-POC-master-0.0.1-SNAPSHOT.jar pedrosa.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "pedrosa.jar"]

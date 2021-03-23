FROM maven:3-openjdk-11 as builder

WORKDIR /app

COPY pom.xml /app/
COPY src /app/src

RUN mvn clean verify


RUN mvn package -o

FROM openjdk:11-jre-slim

WORKDIR /usr/app/

COPY --from=builder /app/target/*.jar /usr/app/planner.jar

CMD [ "java", "-jar", "planner.jar" ]
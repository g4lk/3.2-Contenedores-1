FROM maven:3.6.3-openjdk-11 as builder

WORKDIR /app


COPY pom.xml .

RUN mvn dependency:go-offline

COPY src .

RUN mvn package -Dmaven.test.skip=true

FROM openjdk:11-jre-slim

WORKDIR /usr/app/

COPY --from=builder /app/target/*.jar /usr/app/

CMD [ "java", "-jar", "planner.jar" ]
FROM openjdk:21

COPY target/customer-service-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
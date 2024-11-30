# Stage 1: Build the application
FROM maven:3.9.8-eclipse-temurin-21 AS build

# Set working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml ./
COPY src ./src

# Build the application and create a JAR file
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:21

# Set working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
# Stage 1: Build the application
FROM maven:3.9-openjdk-21 AS builder

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
COPY --from=builder /app/target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
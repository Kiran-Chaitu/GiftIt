# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Create app directory
WORKDIR /app

# Copy the jar into container
COPY ./target/eureka-server-service-0.0.1-SNAPSHOT.jar /app/eureka-server.jar

# Expose port for Eureka (8761)
EXPOSE 8761

# Run the jar
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]

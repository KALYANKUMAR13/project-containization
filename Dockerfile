# Use a base image with Maven and JDK installed
FROM maven:3.8.4-openjdk-17 AS build


# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY pom.xml .
COPY src src

# Build the Spring Boot application using Maven
RUN mvn clean package -DskipTests


#FROM adoptopenjdk:11-jre-hotspot
FROM openjdk:17-jdk
# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Specify the command to run the application
CMD ["java", "-jar", "app.jar"]
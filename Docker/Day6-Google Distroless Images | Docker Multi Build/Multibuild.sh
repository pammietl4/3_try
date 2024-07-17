Pet clinic project
https://github.com/spring-projects/spring-petclinic

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the container
COPY . .

# Package the application (this will create a jar file in the target directory)
RUN ./mvnw package -DskipTests

# Expose the port the application runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "target/ *.jar"]

# Use a base image with Maven and JDK pre-installed
FROM maven:3.8.3-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline

# Copy the rest of the project source code
COPY src ./src

# Build the project
RUN mvn package

# Use a base image with Tomcat for deploying the WAR file
FROM tomcat:9.0-jdk11

# Copy the built WAR file from the previous stage to Tomcat's webapps directory
COPY --from=builder /app/target/Project_4.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Specify the command to run Tomcat
CMD ["catalina.sh", "run"]
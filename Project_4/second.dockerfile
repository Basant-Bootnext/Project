
# Stage 1: Build the Maven project
FROM maven:3.8.1-openjdk-11 AS builder

# Set the working directory
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the entire project source
COPY src ./src

# Build the project
RUN mvn clean install -U

# Stage 2: Serve the built artifacts using nginx
FROM nginx:alpine

# Copy the built artifacts from the Maven build stage to nginx's html directory
COPY --from=builder /app/target/*.war /usr/share/nginx/html/

# Expose the port nginx listens on
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Install Python and SQLite3
RUN apt-get update && apt-get install -y python3 sqlite3

# Copy your existing Strapi project to the container (assuming it's in the same directory as the Dockerfile)
COPY . /app/my-strapi-project

# Change directory to the Strapi project
WORKDIR /app/my-strapi-project

# Install Strapi dependencies
RUN npm install

# Create a directory for SQLite data and set appropriate permissions
RUN mkdir -p /app/my-strapi-project/data && chmod 777 /app/my-strapi-project/data

# Set SQLite data directory as a volume
VOLUME /app/my-strapi-project/data

# Build the Strapi project (you can customize this if needed)
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start the Strapi application, pointing SQLite to the correct data directory
CMD ["npm", "start", "--", "--path", "/app/my-strapi-project/data"]

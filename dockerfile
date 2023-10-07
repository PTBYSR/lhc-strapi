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

# Build the Strapi project (you can customize this if needed)
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start the Strapi application
CMD ["npm", "start"]
# Use the official Node.js image as a parent image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Install Vue CLI
RUN npm install -g @vue/cli

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the Vue.js app will run on
EXPOSE 8080

# Start the Vue.js application
CMD ["npm", "run", "serve"]
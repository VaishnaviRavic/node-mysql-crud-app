# Use a newer Node.js version
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only package files first and install dependencies
COPY package*.json ./

# Install production dependencies (omit dev dependencies for production)
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Expose the port your application listens on
EXPOSE 2000

# Define the command to run the application
CMD ["node", "app.js"]

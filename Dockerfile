FROM node:14
# Set the working directory
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
RUN npm install
# Copy the rest of the application code to the working directory
COPY . .
# Expose the port 
EXPOSE 3000
# Environment variables for MongoDB and Redis connection
ENV MONGODB_URI mongodb://mongo-hostname:****/mydb
ENV REDIS_URI redis://redis-hostname:****
# Command to start the Node.js application
CMD ["node", "app.js"]


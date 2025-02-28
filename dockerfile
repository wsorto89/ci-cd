# Use Node.js image to build the app
FROM node:22 AS build

WORKDIR /app

# Install dependencies and build the app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Use Nginx to serve the built app
FROM nginx:alpine

# Copy build output to Nginx's HTML folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the app
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
